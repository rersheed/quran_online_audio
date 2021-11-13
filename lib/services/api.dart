import 'package:quran_online_audio/models/reciters_class.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_online_audio/models/surah_class.dart';

class Api {
  final _baseUrl = "http://api.alquran.cloud/v1/";

  Future<List<Surah>> getSurahs() async {
    var data = await http.get(Uri.parse(_baseUrl + 'surah'));
    var jsonData = json.decode(data.body);

    List<Surah> surahs = [];
    for (var s in jsonData['data']) {
      Surah surah = Surah(s['number'], s['name'], s['englishName'],
          s['englishNameTranslation'], s['numberOfAyahs'], s['revelationType']);

      surahs.add(surah);
    }
    return surahs;
  }

  Future<List<String>> getAudioUrls(int surah, String reciterId) async {
    var data = await http.get(
        Uri.parse(_baseUrl + '/surah/' + surah.toString() + '/' + reciterId));
    var jsonData = json.decode(data.body);
    List<String> urls = [];
    for (var u in jsonData['data']['ayahs']) {
      urls.add(u['audio']);
    }
    return urls;
  }

  Future<List<Reciter>> getReciters() async {
    var data = await http.get(Uri.parse(
        _baseUrl + "edition?format=audio&language=ar&type=versebyverse"));
    var jsonData = json.decode(data.body);
    List<Reciter> reciters = [];

    for (var rc in jsonData['data']) {
      Reciter reciter =
          Reciter(rc["identifier"], rc["name"], rc["englishName"]);
      reciters.add(reciter);
    }
    return reciters;
  }
}
