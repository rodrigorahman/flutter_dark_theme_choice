import 'package:dark_theme_choice/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final AppController appController;

  _HomeControllerBase(this.appController);

  
}
