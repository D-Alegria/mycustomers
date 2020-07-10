import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/core/services/store_services.dart';
import 'package:mycustomers/core/models/store.dart';

class StoreRepository {
  static List _stores;
  static StoreService _ss = locator<StoreService>();
  static Store _currentStore;

  static List<Store> get stores => _stores;
  static Store get currentStore => _currentStore;

  static changeSelectedStore(String id) {
    var newStore = _stores.firstWhere((elem) => elem.id == id, orElse: () => null);
    _currentStore = newStore ?? _currentStore;
  }

  static Future<void> updateStores() async {
    var stores = await _ss.getStores();
    _stores = stores ?? _stores;
    if (_stores != null && _stores.isNotEmpty) _currentStore = _currentStore ?? _stores[0];
    print('Stores is now: $_stores and current store is $_currentStore');
  }

  static Future<Store> getStoreById(String id) async {
    try {
      return _stores.firstWhere((store) => store.id == id);
    } on StateError {
      var store = await _ss.getStore(id);
      return store;
    }
  }



}