import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qur'an Online Audio",
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'OpenSans'),
      home: const HomeScreen(),
    );
  }
}
