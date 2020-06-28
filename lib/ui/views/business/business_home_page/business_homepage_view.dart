import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:mycustomers/ui/widgets/shared/under_construction.dart';
import 'package:stacked/stacked.dart';

import 'business_homepage_viewmodel.dart';

class BusinessHomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BusinessHomePageViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        drawerEdgeDragWidth: SizeConfig.xMargin(context, 20.0),
        endDrawer: Container(
          decoration: BoxDecoration(
            color: BrandColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.xMargin(context, 5.0),
            vertical: SizeConfig.xMargin(context, 5.0),
          ),
          width: SizeConfig.xMargin(context, 85.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    sideBarMenuButton(
                      context: context,
                      label: 'Profile',
                      onTap: () {
                        model.setActive(Active.profile);
                        model.navigateToProfilePage();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.xMargin(context, 10.0),
                    ),
                    sideBarMenuButton(
                      context: context,
                      label: 'Business Card',
                      onTap: () {
                        model.setActive(Active.businessCard);
                        model.navigateToBusinessCardPage();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.xMargin(context, 10.0),
                    ),
                    sideBarMenuButton(
                      context: context,
                      label: 'Support',
                      onTap: () {
                        model.setActive(Active.support);
                        model.navigateToSupportPage();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.xMargin(context, 10.0),
                    ),
                    sideBarMenuButton(
                      context: context,
                      label: 'Settings',
                      onTap: () {
                        model.setActive(Active.settings);
                        model.navigateToSettingsPage();
                      },
                    ),
                  ],
                ),
              ),
              Text('Copyright, 2020')
            ],
          ),
        ),
        body: SafeArea(
          child: UnderConstruction(),
          //TODO: Implement Profile Page
        ),
      ),
      viewModelBuilder: () => BusinessHomePageViewModel(),
    );
  }

  GestureDetector sideBarMenuButton(
      {BuildContext context, String label, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            color: const Color(0xFFADB1E6),
          ),
          SizedBox(
            width: SizeConfig.textSize(context, 4),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: SizeConfig.textSize(context, 8),
              color: const Color(0xFFADB1E6),
              fontWeight: FontWeight.bold,
              letterSpacing: SizeConfig.textSize(context, -0.2),
            ),
          ),
        ],
      ),
    );
  }
}
