import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  final AppController controller;

  const AppWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.themeType != null) {
          return MaterialApp(
            navigatorKey: Modular.navigatorKey,
            title: 'Flutter Slidy',
            theme: controller.themeType,
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
