/// code : 200
/// status : "OK"
/// data : {"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7,"ayahs":[{"number":1,"text":"﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ","numberInSurah":1,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":2,"text":"الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ","numberInSurah":2,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":3,"text":"الرَّحْمَٰنِ الرَّحِيمِ","numberInSurah":3,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":4,"text":"مَالِكِ يَوْمِ الدِّينِ","numberInSurah":4,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":5,"text":"إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ","numberInSurah":5,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":6,"text":"اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ","numberInSurah":6,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":7,"text":"صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ","numberInSurah":7,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false}],"edition":{"identifier":"quran-simple","language":"ar","name":"القرآن الكريم المبسط (تشكيل بسيط) (simple)","englishName":"Simple","format":"text","type":"quran","direction":"rtl"}}

class SuraAudioResponse {
  SuraAudioResponse({
    this.code,
    this.status,
    this.data,
  });

  SuraAudioResponse.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? code;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// number : 1
/// name : "سُورَةُ ٱلْفَاتِحَةِ"
/// englishName : "Al-Faatiha"
/// englishNameTranslation : "The Opening"
/// revelationType : "Meccan"
/// numberOfAyahs : 7
/// ayahs : [{"number":1,"text":"﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ","numberInSurah":1,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":2,"text":"الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ","numberInSurah":2,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":3,"text":"الرَّحْمَٰنِ الرَّحِيمِ","numberInSurah":3,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":4,"text":"مَالِكِ يَوْمِ الدِّينِ","numberInSurah":4,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":5,"text":"إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ","numberInSurah":5,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":6,"text":"اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ","numberInSurah":6,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":7,"text":"صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ","numberInSurah":7,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false}]
/// edition : {"identifier":"quran-simple","language":"ar","name":"القرآن الكريم المبسط (تشكيل بسيط) (simple)","englishName":"Simple","format":"text","type":"quran","direction":"rtl"}

class Data {
  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  Data.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
    edition =
        json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }

  num? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  num? numberOfAyahs;
  List<Ayahs>? ayahs;
  Edition? edition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['revelationType'] = revelationType;
    map['numberOfAyahs'] = numberOfAyahs;
    if (ayahs != null) {
      map['ayahs'] = ayahs?.map((v) => v.toJson()).toList();
    }
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    return map;
  }
}

/// identifier : "quran-simple"
/// language : "ar"
/// name : "القرآن الكريم المبسط (تشكيل بسيط) (simple)"
/// englishName : "Simple"
/// format : "text"
/// type : "quran"
/// direction : "rtl"

class Edition {
  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  Edition.fromJson(dynamic json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = identifier;
    map['language'] = language;
    map['name'] = name;
    map['englishName'] = englishName;
    map['format'] = format;
    map['type'] = type;
    map['direction'] = direction;
    return map;
  }
}

/// number : 1
/// text : "﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ"
/// numberInSurah : 1
/// juz : 1
/// manzil : 1
/// page : 1
/// ruku : 1
/// hizbQuarter : 1
/// sajda : false

class Ayahs {
  Ayahs({
    this.number,
    this.text,
    this.numberInSurah,
    this.audio,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  Ayahs.fromJson(dynamic json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    audio = json['audio'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  num? number;
  String? text;
  num? numberInSurah;
  String? audio;
  num? juz;
  num? manzil;
  num? page;
  num? ruku;
  num? hizbQuarter;
  dynamic sajda;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['text'] = text;
    map['numberInSurah'] = numberInSurah;
    map['audio'] = audio;
    map['juz'] = juz;
    map['manzil'] = manzil;
    map['page'] = page;
    map['ruku'] = ruku;
    map['hizbQuarter'] = hizbQuarter;
    map['sajda'] = sajda;
    return map;
  }
}
