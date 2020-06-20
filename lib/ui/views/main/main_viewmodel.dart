import 'package:flutter/material.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:mycustomers/app/router.dart';
import 'package:mycustomers/core/models/business_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainViewModel extends BaseViewModel {
  final PageController _controller =
  PageController(initialPage: 0, keepPage: true);

  PageController get controller => _controller;

  String _username;

  String get currentUsername => _username;
  int _pageIndex;

  int get currentPageIndex => _pageIndex;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void initialise() {
    _username = 'wearsmute';
    _pageIndex = 0;
    notifyListeners();
  }

  Business selectedBusiness = Business.business[0];

  void changeBusiness(value) {
    selectedBusiness = value;
    notifyListeners();
    // print(value.businessName); //Uncomment to see value in terminal

    // TODO: Create additional Function to Use Value and Change the Operation.
  }


  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToAddCustomer() async {
    await _navigationService.navigateTo(Routes.addcustomerRoute);
  }
}
