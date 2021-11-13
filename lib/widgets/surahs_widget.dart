import 'package:flutter/material.dart';
import 'package:quran_online_audio/models/reciters_class.dart';
import 'package:quran_online_audio/models/surah_class.dart';
import 'package:quran_online_audio/services/api.dart';
import 'package:quran_online_audio/shared.dart';
import 'package:quran_online_audio/widgets/loading_widget.dart';

class SurahsWidget extends StatefulWidget {
  final String reciterId;
  const SurahsWidget({Key? key, required this.reciterId}) : super(key: key);

  @override
  _SurahsWidgetState createState() => _SurahsWidgetState();
}

class _SurahsWidgetState extends State<SurahsWidget> {
  bool isPlaying = false;

  Future<List<Surah>> _getSurahs() async {
    Api api = Api();
    List<Surah> surahs = await api.getSurahs();
    return surahs;
  }

  Future<void> _playSurah(int surah) async {
    Api api = Api();
    String reciterId = widget.reciterId;
    List<String> ayahs = await api.getAudioUrls(surah, reciterId);
    print(ayahs);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSurahs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Loading();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  snapshot.data[index].name,
                  textDirection: TextDirection.rtl,
                  style: kTitleReciterInList,
                ),
                subtitle: Text(
                  snapshot.data[index].englishName,
                  textDirection: TextDirection.rtl,
                  style: kTitleReciterInList,
                ),
                leading: CircleAvatar(
                  child: Text(snapshot.data[index].numberOfAyahs.toString()),
                ),
                trailing: CircleAvatar(
                  child: Text(
                    snapshot.data[index].number.toString(),
                  ),
                ),
                onTap: () {
                  _playSurah(snapshot.data[index].number);
                },
              );
            },
          );
        }
      },
    );
  }
}
