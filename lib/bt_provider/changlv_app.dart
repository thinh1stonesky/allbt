
import 'package:bt1_el/bt_provider/changelv_page.dart';
import 'package:bt1_el/bt_provider/sanpham_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ChangeLV extends StatelessWidget {
  const ChangeLV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QLSanPham(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChangeListView",
      home: ChangeLVPage(),
    ),
    );
  }
}
