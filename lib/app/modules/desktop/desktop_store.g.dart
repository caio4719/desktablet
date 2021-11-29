// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desktop_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DesktopStore on _DesktopStoreBase, Store {
  final _$isMenuOpenAtom = Atom(name: '_DesktopStoreBase.isMenuOpen');

  @override
  bool get isMenuOpen {
    _$isMenuOpenAtom.reportRead();
    return super.isMenuOpen;
  }

  @override
  set isMenuOpen(bool value) {
    _$isMenuOpenAtom.reportWrite(value, super.isMenuOpen, () {
      super.isMenuOpen = value;
    });
  }

  final _$desktoShortCutAtom = Atom(name: '_DesktopStoreBase.desktoShortCut');

  @override
  List<String> get desktoShortCut {
    _$desktoShortCutAtom.reportRead();
    return super.desktoShortCut;
  }

  @override
  set desktoShortCut(List<String> value) {
    _$desktoShortCutAtom.reportWrite(value, super.desktoShortCut, () {
      super.desktoShortCut = value;
    });
  }

  final _$favoritesAppsAtom = Atom(name: '_DesktopStoreBase.favoritesApps');

  @override
  List<String> get favoritesApps {
    _$favoritesAppsAtom.reportRead();
    return super.favoritesApps;
  }

  @override
  set favoritesApps(List<String> value) {
    _$favoritesAppsAtom.reportWrite(value, super.favoritesApps, () {
      super.favoritesApps = value;
    });
  }

  final _$updateFavoritesAsyncAction =
      AsyncAction('_DesktopStoreBase.updateFavorites');

  @override
  Future updateFavorites(dynamic goel, dynamic appName) {
    return _$updateFavoritesAsyncAction
        .run(() => super.updateFavorites(goel, appName));
  }

  final _$_DesktopStoreBaseActionController =
      ActionController(name: '_DesktopStoreBase');

  @override
  dynamic toglleMenu() {
    final _$actionInfo = _$_DesktopStoreBaseActionController.startAction(
        name: '_DesktopStoreBase.toglleMenu');
    try {
      return super.toglleMenu();
    } finally {
      _$_DesktopStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isMenuOpen: ${isMenuOpen},
desktoShortCut: ${desktoShortCut},
favoritesApps: ${favoritesApps}
    ''';
  }
}
