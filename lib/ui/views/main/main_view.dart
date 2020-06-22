import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycustomers/core/models/business_model.dart';
import 'package:mycustomers/ui/views/business/business_home_page/business_homepage_view.dart';
import 'package:mycustomers/ui/views/home/home_page/home_page_view.dart';
import 'package:mycustomers/ui/views/marketing/marketing_home_page/marketing_homepage_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:mycustomers/core/extensions/string_extension.dart';

import 'main_viewmodel.dart';

part '../../widgets/main/main_view_app_bar.dart';

part '../../widgets/main/main_view_nav_bar.dart';

final String home = 'assets/icons/home.svg';
final String marketing = 'assets/icons/marketing.svg';
final String profile = 'assets/icons/profile.svg';
final String noNotification = 'assets/icons/no_notification.svg';
final String notification = 'assets/icons/notification.svg';
final String search = 'assets/icons/search.svg';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: mainViewNavBar(model, model.controller, context),
        backgroundColor: Theme.of(context).appBarTheme.color,
        body: SafeArea(
          child: Column(
            children: [
              HeaderBar(),
              Expanded(
                child: PageView(
                  pageSnapping: true,
                  controller: model.controller,
                  onPageChanged: (int index) => model.pageIndex = index,
                  children: [
                    HomePageView(),
                    MarketingHomePageView(),
                    BusinessHomePageView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onModelReady: (model) => model.initialise(),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
