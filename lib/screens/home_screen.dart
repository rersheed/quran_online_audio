import 'package:flutter/material.dart';
import 'package:quran_online_audio/widgets/reciters_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Reciters"),
        centerTitle: true,
      ),
      body: RecitersWidget(),
    );
  }
}
