import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_new/api_manager/api_manager.dart';
import 'package:islami_new/models/SuraAudioResponse.dart';

class SuraContentProvider extends ChangeNotifier {
  List<String> verses = [];
  List<Ayahs> apiAyahs = [];

  bool isLoadingAudio = false;
  String? errorMessage;

  late AudioPlayer audioPlayer;
  int currentAudioIndex = 0; // لمتابعة الآية الشغالة حالياً
  bool isPlayingAll = false; // لمعرفة هل المشغل يعمل الآن أم متوقف

  SuraContentProvider() {
    audioPlayer = AudioPlayer();
    // الإنصات لانتهاء الآية لتشغيل التالية تلقائياً
    audioPlayer.onPlayerComplete.listen((event) {
      if (isPlayingAll) {
        playNextAyah();
      }
    });
  }

  Future<void> loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.trim().split("\n");
    verses = lines;
    notifyListeners();
  }

  Future<void> loadSuraAudio(int suraIndex) async {
    isLoadingAudio = true;
    errorMessage = null;
    apiAyahs = [];
    notifyListeners();

    try {
      var response = await ApiManager.getSuraAudio(suraIndex);
      if (response.data?.ayahs != null) {
        apiAyahs = response.data!.ayahs!;
      } else {
        errorMessage = "No audio available";
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoadingAudio = false;
    notifyListeners();
  }

  void playCurrentAyah() async {
    if (apiAyahs.isNotEmpty) {
      String? audioUrl = apiAyahs[currentAudioIndex].audio;
      if (audioUrl != null) {
        await audioPlayer.play(UrlSource(audioUrl));
        isPlayingAll = true;
        notifyListeners();
      }
    }
  }

  void playNextAyah() async {
    if (currentAudioIndex < apiAyahs.length - 1) {
      currentAudioIndex++; // الانتقال لمؤشر الآية التالية
      playCurrentAyah();
    } else {
      // إذا انتهت السورة كاملة
      currentAudioIndex = 0;
      isPlayingAll = false;
      notifyListeners();
    }
  }

  void toggleAudio() async {
    if (isPlayingAll) {
      await audioPlayer.pause();
      isPlayingAll = false;
    } else {
      playCurrentAyah();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    //تنظيف الذاكرة عند الخروج من الشاشة وتدمير الـ Provider
    super.dispose();
  }
}
