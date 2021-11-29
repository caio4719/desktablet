import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'desktop_store.g.dart';

class DesktopStore = _DesktopStoreBase with _$DesktopStore;

abstract class _DesktopStoreBase with Store {
  @observable
  bool isMenuOpen = false;

  @observable
  List<String> desktoShortCut = [];

  @observable
  List<String> favoritesApps = [];

  @action
  toglleMenu() {
    isMenuOpen = !isMenuOpen;
  }

  @action
  updateFavorites(goel, appName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (favoritesApps.isEmpty) {
      favoritesApps.add(appName);
      prefs.setString(appName, "favoritesApps");
    }
    if (favoritesApps.isNotEmpty) {
      print(favoritesApps.isEmpty);
      for (var i = 0; i < favoritesApps.length; i++) {
        if (appName == favoritesApps[i]) {
          favoritesApps.remove(favoritesApps[i]);
          prefs.setString(appName, "favoritesApps");
        }
      }
    }
    // else {
    //   favoritesApps.add(appName);
    //   prefs.setString(appName, "favoritesApps");
    // }

    // if (favoritesApps.isEmpty) {
    //   favoritesApps.add(appName);
    //   prefs.setString(appName, "favoritesApps");
    // } else {
    // for (var i = 0; i < favoritesApps.length; i++) {
    //   if (appName == favoritesApps[i]) {
    //     favoritesApps.remove(favoritesApps[i]);

    //     prefs.setString(appName, "favoritesApps");
    //   } else {
    //       favoritesApps.add(appName);
    //       prefs.setString(appName, "favoritesApps");
    //     }
    //   }
    // }
    print(favoritesApps);
  }
}
