import 'package:flutter/material.dart';

class Model1 extends ChangeNotifier {
  static int count = 0;
  String title;
  Model1(this.title);
  
  void test(String text) {
    title = text;
    notifyListeners();
  }

  int contador() {
    count++;
    return count;
  }
}
