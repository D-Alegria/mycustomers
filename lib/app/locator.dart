import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mycustomers/core/data_sources/log/log_local_data_source.dart';
import 'package:mycustomers/core/data_sources/transaction/transaction_local_data_source.dart';
import 'package:mycustomers/core/models/hive/business_card/business_card_model.dart';
import 'package:mycustomers/core/models/hive/customer_contacts/customer_contact_h.dart';
import 'package:mycustomers/core/models/hive/password_manager/password_manager_model_h.dart';
import 'package:mycustomers/core/models/hive/transaction/transaction_model_h.dart';
import 'package:mycustomers/core/services/auth/auth_service.dart';
import 'package:mycustomers/core/services/auth/auth_service_impl.dart';
import 'package:hive/hive.dart';
import 'package:mycustomers/core/services/business_card_service.dart';
import 'package:mycustomers/core/services/bussiness_setting_service.dart';
import 'package:mycustomers/core/services/connectivity/connectivity_service_impl.dart';
import 'package:mycustomers/core/services/connectivity/connectivity_services.dart';
import 'package:mycustomers/core/services/customer_contact_service.dart';
import 'package:mycustomers/core/services/customer_services.dart';
import 'package:mycustomers/core/services/http/http_service.dart';
import 'package:mycustomers/core/services/http/http_service_impl.dart';
import 'package:mycustomers/core/services/owner_services.dart';
import 'package:mycustomers/core/services/api_services.dart';
import 'package:mycustomers/core/services/page_service.dart';
import 'package:mycustomers/core/services/password_manager_services.dart';
import 'package:mycustomers/core/services/storage_util_service.dart';
import 'package:mycustomers/core/utils/file_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycustomers/core/services/user_services.dart';
import 'package:mycustomers/core/services/permission_service.dart';
import 'package:mycustomers/core/data_sources/stores/stores_remote_data_source.dart';
import 'package:mycustomers/core/data_sources/stores/stores_local_data_source.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:mycustomers/core/models/hive/store/store_h.dart';

final GetIt locator = GetIt.instance;

const bool USE_MOCK_CUSTOMER = true;

String isoCode = 'NG';

Future<void> setIso() async {
  try {
    isoCode = await FlutterSimCountryCode.simCountryCode;
  } on PlatformException {}
}

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator(
    {bool useMockContacts: false,
    bool useMockCustomer: true,
    bool test = false}) async {
 //Inizialize Hive path
  Directory appDocDir =test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocDir.path);

  // Services
  locator.registerLazySingleton(
    () => NavigationService(),
  );
  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<IApi>(
    () => ApiServices(),
  );
  locator.registerLazySingleton(
    () => PageService(),
  );
  locator.registerLazySingleton<ICustomerService>(
    () => USE_MOCK_CUSTOMER ? MockCustomerService() : CustomerService(),
  );
  locator.registerLazySingleton<CustomerContactService>(
    () => CustomerContactService(),
  );
  locator.registerLazySingleton<PasswordManagerService>(
    () => PasswordManagerService(),
  );
  locator.registerLazySingleton<BussinessSettingService>(
    () => BussinessSettingService(),
  );
  await _setupSharedPreferences();
  locator.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(),
  );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl(),
  );
  locator.registerLazySingleton<IOwnerServices>(
    () => useMockContacts ? MockOwnerService() : OwnerServices(),
  );
  locator.registerLazySingleton<IBusinessCardService>(
    () => BusinessCardService(),
  );
  locator.registerLazySingleton<UserService>(
    () => UserService(),
  );

  // Data sources
  // final _ss = StoresLocalDataSourceImpl();
  // await _ss.init();

  locator.registerLazySingleton<StoreDataSourceImpl>(
    () => StoreDataSourceImpl(),
  );

  // locator.registerLazySingleton<StoresLocalDataSource>(
  //   () => _ss,
  // );
  locator.registerLazySingleton<TransactionLocalDataSourceImpl>(
    () => TransactionLocalDataSourceImpl(),
  );
  locator.registerLazySingleton<LogsLocalDataSourceImpl>(
    () => LogsLocalDataSourceImpl(),
  );

  // Util
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
  locator.registerLazySingleton<IPermissionService>(
    () => useMockContacts ? MockPermissions() : PermissionService(),
  );

  // External
  locator.registerLazySingleton<HiveInterface>(() => Hive);

  //Initialization for all boxes
  await LogsLocalDataSourceImpl().init();
  await TransactionLocalDataSourceImpl().init();

  
  Hive.registerAdapter(BusinessCardAdapter());
  Hive.registerAdapter(PasswordManagerAdapter());
  Hive.registerAdapter(CustomerContactAdapter());
  //Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(StoreHAdapter());

  if (!test) await setIso();
}

Future<void> openBoxes() {

}

Future<void> _setupSharedPreferences() async {
  final storage = await SharedStorageUtil.getInstance();
  locator.registerLazySingleton<IStorageUtil>(() => storage);
}
