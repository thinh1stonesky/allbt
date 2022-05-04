
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  late int _count = 0;
  void incrementCount(){
    setState(() {
      _count++;
    });
  }

  void decrementCount(){
    setState(() {
      _count--;
    });
  }
  @override
  void initState() {
    print('run inting');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('run building');
    return MaterialApp(

      title: 'This is my app',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Computer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: (){
                  incrementCount();
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Icon(Icons.ac_unit),
              ),
              Text(_count.toString()),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: (){
                  decrementCount();
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Icon(Icons.accessibility_new_sharp)
              ),

            ],
          ),
        ),
      ),
    );
  }
}
