
import 'dart:convert';

import 'package:bt1_el/image_JSON/photo_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bt1_el/image_JSON/photos.dart';

class PhotosPageState extends StatefulWidget {
  const PhotosPageState({Key? key}) : super(key: key);

  @override
  State<PhotosPageState> createState() => _PhotosPageStateState();
}

class _PhotosPageStateState extends State<PhotosPageState> {

  late Future<List<Photo>> photos;



  @override
  void initState() {
    photos = fetchPhotos();


  }

  Future<List<Photo>> fetchPhotos() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos") );
    if(response.statusCode==200)
    {
      List<Photo> photos;
      var list = json.decode(response.body) as List;
      photos = list.map((item) => Photo.fromJson(item)).toList();
      return photos;
    }
    else{
      print("Không tải được Album");
      throw Exception("Khong tai duoc Album");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image JSON"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photos,
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print("Error");
            return Text("Erorr");
          }
          return snapshot.hasData
              ? PhotoList(photos: snapshot.data!)
              : const Center(
            child: CircularProgressIndicator(),
          );

        },

      ),
    );
  }
}
