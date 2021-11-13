import 'package:flutter/material.dart';
import 'package:quran_online_audio/models/reciters_class.dart';
import 'package:quran_online_audio/screens/surahs_lists_screen.dart';
import 'package:quran_online_audio/services/api.dart';
import 'package:quran_online_audio/shared.dart';
import 'package:quran_online_audio/widgets/loading_widget.dart';

class RecitersWidget extends StatefulWidget {
  RecitersWidget({Key? key}) : super(key: key);

  @override
  _RecitersWidgetState createState() => _RecitersWidgetState();
}

class _RecitersWidgetState extends State<RecitersWidget> {
  Future<List<Reciter>> _getReciters() async {
    Api api = Api();
    List<Reciter> reciters = await api.getReciters();
    return reciters;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getReciters(),
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
                  style: kSubtitleReciterInList,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SurahList(reciter: snapshot.data[index]),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
