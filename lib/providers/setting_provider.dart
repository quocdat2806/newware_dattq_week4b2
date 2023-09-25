import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier {
  bool isSwitch = false;
  void switchButton(){
    isSwitch = !isSwitch;
    notifyListeners();
  }

}