

import 'package:bt1_el/image_JSON/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoList extends StatelessWidget {
  List<Photo> photos;
  PhotoList({Key? key, required this.photos}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200, padding: EdgeInsets.all((5)),mainAxisSpacing: 5, crossAxisSpacing: 5,
      children: List.generate(photos.length, (index) => Container(decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
        child:
          FadeInImage.assetNetwork(placeholder: "asset/Image/loading.gif",
              image: photos[index].thumbnailUrl)
        // Image.network(photos[index].thumbnailUrl),


      )),
    );
  }
}