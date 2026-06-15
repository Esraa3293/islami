import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_new/models/hadeth_model.dart';

class AhadethProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  Future<void> loadAhadeth() async {
    String ahadethFile =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = ahadethFile.trim().split("#");
    List<HadethModel> localAhadeth = [];
    for (int i = 0; i < ahadeth.length; i++) {
      int lastLIndexOfFirstLine = ahadeth[i].trim().indexOf("\n");
      String title = ahadeth[i].trim().substring(0, lastLIndexOfFirstLine);
      String content =
          ahadeth[i].trim().substring(lastLIndexOfFirstLine).trim();
      HadethModel hadethModel = HadethModel(title, content);
      localAhadeth.add(hadethModel);
    }
    allAhadeth = localAhadeth;
    notifyListeners();
  }
}
