// ignore_for_file: prefer_const_constructors

import 'package:device_apps/device_apps.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desktablet/app/modules/desktop/desktop_store.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:blur/blur.dart';

class DesktopPage extends StatefulWidget {
  final String title;
  const DesktopPage({Key? key, this.title = 'DesktopPage'}) : super(key: key);
  @override
  DesktopPageState createState() => DesktopPageState();
}

class DesktopPageState extends State<DesktopPage> {
  final DesktopStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeght = screenHeight - statusBarHeight;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    const NetworkImage("https://i.redd.it/52f61nfzmwl51.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Observer(
            builder: (_) => Visibility(
              visible: store.isMenuOpen,
              child: Center(
                child: SizedBox(
                  width: deviceWidth * 0.6,
                  height: deviceHeght * 0.6,
                  child: Stack(
                    children: [
                      FutureBuilder(
                        future: DeviceApps.getInstalledApplications(
                          onlyAppsWithLaunchIntent: true,
                          includeSystemApps: true,
                          includeAppIcons: true,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            List<Application> allApps =
                                snapshot.data as List<Application>;

                            return GridView.count(
                                crossAxisCount: 6,
                                children: List.generate(
                                  allApps.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        FocusedMenuHolder(
                                          blurBackgroundColor: Colors.black,
                                          blurSize: 8,
                                          menuWidth: deviceWidth * 0.2,
                                          child: GestureDetector(
                                            onTap: () {
                                              DeviceApps.openApp(
                                                  allApps[index].packageName);
                                            },
                                            child: Image.memory(
                                              (allApps[index]
                                                      as ApplicationWithIcon)
                                                  .icon,
                                              width: 50,
                                            ),
                                          ),
                                          onPressed: () {},
                                          menuItems: <FocusedMenuItem>[
                                            FocusedMenuItem(
                                              title: Text("Pin on Dock"),
                                              trailingIcon: Icon(
                                                  Icons.star_border_outlined),
                                              onPressed: () {
                                                store.updateFavorites("Add",
                                                    allApps[index].appName);
                                                print(index);
                                              },
                                            ),
                                            FocusedMenuItem(
                                              title: Text("Create Shortcut"),
                                              trailingIcon:
                                                  Icon(Icons.shortcut_outlined),
                                              onPressed: () {
                                                print(store.favoritesApps);
                                              },
                                            ),
                                            FocusedMenuItem(
                                              title: Text("Details"),
                                              trailingIcon:
                                                  Icon(Icons.settings),
                                              onPressed: () {
                                                DeviceApps.openAppSettings(
                                                    allApps[index].packageName);
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          allApps[index].appName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                                ));
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        Observer(
                          builder: (_) => SizedBox(
                            width: deviceWidth - 100,
                            height: deviceHeght * 0.065,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  autofocus: true,
                                  icon: const Icon(Icons.menu),
                                  tooltip: 'Menu',
                                  onPressed: () {
                                    store.toglleMenu();
                                  },
                                ),
                                Observer(
                                    builder: (_) =>
                                        Text("${store.favoritesApps}")),
                              ],
                            ),
                          ).frosted(
                            blur: 10,
                            borderRadius: BorderRadius.circular(20),
                            padding: EdgeInsets.all(8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
