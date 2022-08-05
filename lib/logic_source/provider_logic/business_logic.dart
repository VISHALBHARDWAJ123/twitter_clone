import 'package:flutter/material.dart';

class LogicalClass extends ChangeNotifier {
  TextInputType _keyboardType = TextInputType.phone;
  String _buttonText = "Use email instead";

  String get buttonText => _buttonText;

  TextInputType get keyboardType => _keyboardType;

  void changeKeyboard() {
    _keyboardType == TextInputType.phone
        ? _keyboardType = TextInputType.emailAddress
        : _keyboardType = TextInputType.phone;
    _keyboardType == TextInputType.phone
        ? _buttonText = "Use email instead"
        : _buttonText = "Use phone instead";

    notifyListeners();
  }
}
