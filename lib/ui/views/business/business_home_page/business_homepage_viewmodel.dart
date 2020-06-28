import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/app/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum Active { profile, businessCard, support, settings }

class BusinessHomePageViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool profileA = false;
  bool businessCardA = false;
  bool supportA = false;
  bool settingsA = false;

  void setActive(Active active) {
    switch (active) {
      case Active.profile:
        profileA = true;
        businessCardA = false;
        supportA = false;
        settingsA = false;
        break;
      case Active.businessCard:
        profileA = false;
        businessCardA = true;
        supportA = false;
        settingsA = false;
        break;
      case Active.support:
        profileA = false;
        businessCardA = false;
        supportA = true;
        settingsA = false;
        break;
      case Active.settings:
        profileA = false;
        businessCardA = false;
        supportA = false;
        settingsA = true;
        break;
    }
  }

  Future navigateToProfilePage() async {
    // TODO Add navigate to profile page
//    await _navigationService.navigateTo(Routes);
  }

  Future navigateToBusinessCardPage() async {
    // TODO Add navigate to business card page
//    await _navigationService.navigateTo(Routes);
  }

  Future navigateToSupportPage() async {
    // TODO Add navigate to support page
//    await _navigationService.navigateTo(Routes);
  }

  Future navigateToSettingsPage() async {
    // TODO Add navigate to settings page
//    await _navigationService.navigateTo(Routes);
  }
}
