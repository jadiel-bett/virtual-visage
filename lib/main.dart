import 'package:flutter/material.dart';
import '/UI/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadiel Bett',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
