import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:islami_new/models/RadioResponse.dart';
import 'package:islami_new/models/SuraAudioResponse.dart';

class ApiManager {
  static Future<List<Radios>> getRadios() async {
    Uri URL = Uri.https("api.mp3quran.net", "/radios/radio_arabic.json");
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    RadioResponse radioResponse = RadioResponse.fromJson(jsonResponse);
    return radioResponse.radios ?? [];
  }

  static Future<SuraAudioResponse> getSuraAudio(int suraNumber) async {
    Uri URL = Uri.https("api.alquran.cloud", "/v1/surah/$suraNumber/ar.alafasy");
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SuraAudioResponse suraAudioResponse =
        SuraAudioResponse.fromJson(jsonResponse);
    return suraAudioResponse;
  }
}
