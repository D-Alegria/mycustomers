part of '../../views/main/main_view.dart';

///Created by Demilade Oladugba on 6/19/2020

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BusinessSelector(),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.alarm,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red.shade800,
                  radius: 5.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessSelector extends HookViewModelWidget<MainViewModel> {
  BusinessSelector({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, MainViewModel model) =>
      Container(
        width: 80.sp,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Business>(
            isExpanded: true,
            value: model.selectedBusiness,
            items: Business.business.map((business) {
              return DropdownMenuItem<Business>(
                value: business,
                child: Text(
                  business.businessName.capitalize,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                    //     color: Colors.blueAccent,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              model.changeBusiness(value);
            },
          ),
        ),
      );
}
