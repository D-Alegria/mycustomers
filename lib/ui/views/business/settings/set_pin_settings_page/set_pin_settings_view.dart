import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:mycustomers/ui/widgets/animation/fade_in.dart';
import 'package:mycustomers/ui/widgets/shared/dot_pin_field.dart';
import 'package:mycustomers/core/localization/app_localization.dart';
import 'package:mycustomers/ui/widgets/stateful/lazy_index_stacked.dart';
import 'package:stacked/stacked.dart';
import 'set_pin_settings_viewmodel.dart';

class SetPinSettingsPageView extends StatelessWidget {
  final String myCustomerLogo = 'assets/icons/svg/my_customer_logo.svg';

  @override
  Widget build(BuildContext context) {
    TextEditingController createPinController =
        new TextEditingController(text: "");

    TextEditingController confirmPinController =
        new TextEditingController(text: "");

    return ViewModelBuilder<SetPinSettingsViewModel>.reactive(
      builder: (context, model, child) {
        final _views = <Widget>[
          FadeIn(
            child: PinField(
              title: AppLocalizations.of(context).createANewPin,
              textEditingController: createPinController,
              onCompleted: (value) => model.onCreatePinCompleted(value),
            ),
          ),
          FadeIn(
            child: PinField(
              title: AppLocalizations.of(context).confirmNewPin,
              textEditingController: confirmPinController,
              onCompleted: (value) =>
                  model.onConfirmPinCompleted(value, confirmPinController),
            ),
          ),
        ];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.yMargin(context, 15)),
            child: AppBar(
              iconTheme: IconThemeData(color: ThemeColors.background),
              centerTitle: true,
              backgroundColor: BrandColors.primary,
              elevation: 0,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(top: SizeConfig.yMargin(context, 6)),
                child: Expanded(
                  child: SvgPicture.asset(
                    myCustomerLogo,
                    color: ThemeColors.background,
                    height: SizeConfig.yMargin(context, 16),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: BrandColors.primary,
          body: LazyIndexedStack(
            reuse: true,
            index: model.index,
            itemCount: _views.length,
            itemBuilder: (_, index) => _views[index],
          ),
        );
      },
      viewModelBuilder: () => SetPinSettingsViewModel(),
    );
  }
}
