import 'package:flutter/material.dart';
// import 'package:mycustomers/ui/views/business/profile/profile_page_view.dart';
import 'package:mycustomers/ui/views/business/settings/settings_view.dart';
// import 'package:mycustomers/ui/widgets/shared/under_construction.dart';
import 'package:stacked/stacked.dart';


import 'business_homepage_viewmodel.dart';

class BusinessHomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BusinessHomePageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            child:SettingsHomePageView(),
      ),
      ),
      viewModelBuilder: () => BusinessHomePageViewModel(),
    );
  }
}
