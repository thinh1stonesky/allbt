
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? image;
  // ignore: non_constant_identifier_names
  Future PickImage(ImageSource source) async {
      try{
        final image = await ImagePicker().pickImage(source: source);
        if(image == null) {return;}

        final imageTemporary = File(image.path);
        setState(() {
          this.image = imageTemporary;
        });
      }
      on PlatformException catch (e){
        print('Failed to pick image $e');
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: const Text("ImagePicker App"),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            image != null ?
            InkWell(
              onTap: () async {
                final source = await showImageSource(context) as ImageSource;
                if(source == null) {return;}
                else {
                  PickImage(source);
                }

              },
              child: Stack(
                children: [
                  ClipOval(
                    child:  Image.file(image!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      child: ClipOval(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Icon(Icons.camera_enhance_sharp, size: 40, color: Colors.white),
                        ),
                      ),
                  bottom: 0,
                  right: 8,
                  ),
                ],
              ),
            )
                : FlutterLogo(size: 200,),
            Padding(padding: EdgeInsets.only(top: 20),
              child: Text("Image Picker", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
            Spacer(),Spacer(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                onPressed: () => PickImage(ImageSource.gallery),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.image_outlined),
                    Text("Pick Gallery"),
                  ],
                )),),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
            child: ElevatedButton(
                onPressed: () => PickImage(ImageSource.camera),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Text("Pick Camera"),
                  ],
                )),
            ),

          Spacer(),
          ],
        ),
      ),
    );
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context)=> Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            )
          ],
        ));
  }


}
