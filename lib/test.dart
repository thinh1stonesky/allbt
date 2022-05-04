

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              child: Icon(Icons.list, size: 30,),
              onTap: (){
                var dialog = AlertDialog(
                  title: Text('Thông báo'),
                  content: Text("ok"),

                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Text("Ok")
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => dialog);
              },
            ),
            Padding(padding: EdgeInsets.only(right: 20))],

          title: Text("This is a Change Listview App"),
        ),
        body: Container(),
      ),
    );
  }
}
