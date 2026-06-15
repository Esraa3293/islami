import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_new/api_manager/api_manager.dart';

class RadioProvider extends ChangeNotifier {
  late AudioPlayer audioPlayer;
  List<dynamic> radios = [];
  bool isLoading = false;
  String? errorMessage;

  RadioProvider() {
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> fetchRadios() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      var data = await ApiManager.getRadios();
      radios = data;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
