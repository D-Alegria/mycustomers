part of '../../views/main/main_view.dart';

///Created by Demilade Oladugba on 6/19/2020

BottomNavigationBar mainViewNavBar(
    MainViewModel model, PageController controller, BuildContext context) {
  return BottomNavigationBar(
    currentIndex: model.currentPageIndex,
    onTap: (int index) {
      model.pageIndex = index;
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOutBack);
    },
    items: [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
          home,
          color: Theme.of(context).accentIconTheme.color,
          semanticsLabel: 'Home',
        ),
        title: Text(
          "Home",
          style: TextStyle(
            color: const Color.fromRGBO(51, 60, 193, 1),
          ),
        ),
        activeIcon: SvgPicture.asset(
          home,
          color: Theme.of(context).iconTheme.color,
          semanticsLabel: 'Home',
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          marketing,
          color: Theme.of(context).accentIconTheme.color,
          semanticsLabel: 'Marketing',
        ),
        title: Text(
          "Marketing",
          style: TextStyle(
            color: const Color.fromRGBO(51, 60, 193, 1),
          ),
        ),
        activeIcon: SvgPicture.asset(
          marketing,
          color: Theme.of(context).iconTheme.color,
          semanticsLabel: 'Marketing',
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          profile,
          color: Theme.of(context).accentIconTheme.color,
          semanticsLabel: 'Profile',
        ),
        title: Text(
          "Your Company",
          style: TextStyle(
            color: const Color.fromRGBO(51, 60, 193, 1),
          ),
        ),
        activeIcon: SvgPicture.asset(
          profile,
          color: Theme.of(context).iconTheme.color,
          semanticsLabel: 'Profile',
        ),
      ),
    ],
  );
}
