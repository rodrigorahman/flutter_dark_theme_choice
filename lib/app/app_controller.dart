import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  _AppControllerBase() {
    loadTheme();
  }

  @observable
  ThemeData themeType;

  @computed
  bool get isDark => themeType.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeType = ThemeData.light();
    } else {
      themeType = ThemeData.dark();
    }
    saveThemePreferences();
  }

  void saveThemePreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // await Future.delayed(Duration(seconds: 1));
    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeType = ThemeData.dark();
    } else {
      themeType = ThemeData.light();
    }
  }
}
