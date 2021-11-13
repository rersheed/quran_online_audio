import 'package:flutter/material.dart';
import 'package:quran_online_audio/models/reciters_class.dart';
import 'package:quran_online_audio/widgets/surahs_widget.dart';

class SurahList extends StatefulWidget {
  final Reciter reciter;

  const SurahList({Key? key, required this.reciter}) : super(key: key);

  @override
  _SurahListState createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  Widget _body() {
    return Column(
      children: [
        Container(),
        Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciter.name),
        centerTitle: true,
      ),
      // body: SurahsWidget(reciterId: widget.reciter.id),
      body: _body(),
    );
  }
}
