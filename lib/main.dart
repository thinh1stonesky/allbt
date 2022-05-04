
import 'package:bt1_el/bt_provider/changelv_page.dart';
import 'package:bt1_el/test.dart';
import 'package:flutter/material.dart';
import 'bt_provider/changlv_app.dart';
import 'gridview/griedview.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
