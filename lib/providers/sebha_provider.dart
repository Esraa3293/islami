import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];

  void onClicked() {
    counter++;
    if (counter == 33) {
      counter = 0;
      index++;
      index %= azkar.length;
    }
    angle += 0.19;
    notifyListeners();
  }
}
