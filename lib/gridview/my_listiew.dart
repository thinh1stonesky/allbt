import 'package:flutter/material.dart';
import 'list_sp.dart';
import 'san_pham.dart';
import 'griedview.dart';
class ListViewTest extends StatelessWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("This is a listview"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
          Container(
          height: 500,
          width: 500,
              child: ListView.separated(
                itemCount: sanphams.length,
                separatorBuilder: (context,index){

                  return Divider(thickness: 2.5);
                },
                itemBuilder: (context,index) {
                  SanPham sp = sanphams[index];
                  return ListTile(
                    leading: Icon(Icons.fastfood_outlined),
                    title: Text(sp.ten),
                    subtitle: Text(sp.gia.toString()),
                  );
                },
              )),
              Column(
                children: [
                  ButtonBuilder(context, title: 'Input', destination: GridViewTest()),
                ],
              )

            ],
          ),
        ),
      );
  }
  Widget ButtonBuilder(BuildContext context, {required String title, required Widget destination})
  {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => GridViewTest(),)
      );
    },
        child: Text('next'));
  }
  }

