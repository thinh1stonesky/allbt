import 'package:bt1_el/home_page.dart';
import 'package:bt1_el/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()
              )
            );
          }
        ),
        title: Text("This is a ProviderApp"),
      ),
      body: Padding(padding: EdgeInsets.all(10),child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Số lần ấn: ',
              style: TextStyle(
                fontSize: 25,

              ),),
            FutureBuilder<int>(
                initialData: 0,
                future: counter.getValue(),
                builder: (context, snapshot){
                  return Text("${snapshot.data}",
                    style: TextStyle(fontSize: 40),
                  );
                })
          ],
        ),
      )),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add, color: Colors.blue,),
        onPressed: (){
          var provider = context.read<Counter>();
          provider.Increment();
        },
      ),
    );
  }
}
