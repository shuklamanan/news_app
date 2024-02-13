import 'package:flutter/material.dart';

class changestring extends ChangeNotifier {
  String cat = "General";
  String get cats => cat;
  void changecat(String temp) {
    cat = temp;
    notifyListeners();
  }
}
