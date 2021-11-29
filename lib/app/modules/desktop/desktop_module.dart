import 'package:desktablet/app/modules/desktop/desktop_Page.dart';
import 'package:desktablet/app/modules/desktop/desktop_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DesktopModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DesktopStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DesktopPage()),
  ];
}
