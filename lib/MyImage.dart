

import 'package:flutter/material.dart';
class MyImage extends StatelessWidget {
  late String name;
  late int age;
  final _nameCtr = TextEditingController();
  final _ageCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.accessible_sharp),
        title: Text('This is my app'),
        //actions: [
        // Icon(Icons.add_alert),
        //  Icon(Icons.sort),
        //  Icon(Icons.adb_sharp)
        //],
      ),
        drawer: Container(
          width: 200,
          color: Colors.grey,
        ),
        endDrawer: Container(
          width: 200,
          color: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                child: Image.asset('asset/Image/2.jpg', fit: BoxFit.fill,),
              ),
              Container(
                width: 250,
                height: 250,
                child: Image.network('https://1.bp.blogspot.com/-WXSfLvO2X5g/XVeQbdlaaEI/AAAAAAAACmk/P0OkefPnFOIEk0t1OABib6xKPCL1G6MFwCLcBGAs/s1600/gong-ty-5AEFIuud6XI-unsplash.jpg',fit: BoxFit.fill,),
              ),

              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[500],),
                    Icon(Icons.star, color: Colors.yellow[500],),
                    Icon(Icons.star_half, color: Colors.yellow[500],),
                    Icon(Icons.star, color: Colors.black12,),
                    Icon(Icons.star, color: Colors.black12,),
                    Text('195 đánh giá')
                  ],
                ),
              ),
              TextField(
                controller: _nameCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20)
                    )
                  ),
                  labelText: 'Tên',
                  hintText: 'Nhập tên',
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
              TextField(
                controller: _ageCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)
                      )
                  ),
                  labelText: 'Tuổi',
                  hintText: 'Nhập tên',
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Chào ${_nameCtr.text} ${_ageCtr.text} tuổi'),
                      duration: Duration(seconds: 2),
                      )
                    );
                  },
                      child: Text('Submit'))
                ],
              )
            ],
          )
      )
    );
  }
}
