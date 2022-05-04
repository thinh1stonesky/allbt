import 'package:bt1_el/bt_provider/changlv_app.dart';
import 'package:bt1_el/image_picker/image_pickerApp.dart';
import 'package:bt1_el/provider/my_app.dart';
import 'package:flutter/material.dart';
import 'form_field/form_page.dart';
import 'gridview/griedview.dart';
import 'gridview/my_listiew.dart';
import 'image_JSON/photos_json.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is home page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GridViewTest())
                );
              },
              child: const Text('GridView')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FormPage())
                );
              },
              child: const Text('formField')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListViewTest())
                );
              },
              child: const Text('ListView')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyProviderApp())
                );
              },
              child: const Text('ProviderApp')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChangeLV())
                );
              },
              child: const Text('Change listview App')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ImagePickerApp())
                );
              },
              child: const Text('Image Picker')),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PhotosPageState())
                );
              },
              child: const Text('Image JSON')),
        ],
      ),
    );
  }
}
