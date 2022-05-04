
import 'package:flutter/material.dart';
import 'gridview_item.dart';
import 'list_sp.dart';
class GridViewTest extends StatelessWidget {
  List<int> ds = [1,2,3,4,5,6,7,8,9,10];
  int index=1;

  GridViewTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is a GridView'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.extent(
          //crossAxisCount: 1,
          maxCrossAxisExtent: 250,
          children: sanphams.map((e) => GridviewItem(sp: e)).toList(),
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ),
    );

  }
}
