import 'package:flutter/material.dart';
import 'package:sqflite_crud_practice/hidden_drawwer.dart';
import 'package:sqflite_crud_practice/screens/practice_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HiddenDrawer(),
    );
  }
}
