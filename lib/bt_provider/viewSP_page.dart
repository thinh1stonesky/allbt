import 'package:bt1_el/gridview/san_pham.dart';
import 'package:flutter/material.dart';
class ViewSPPage extends StatelessWidget {
  ViewSPPage({Key? key, required this.sp, this.img }) : super(key: key);

  late SanPham sp;
  Image? img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết sản phẩm"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
              color: Colors.red,
              child: FadeInImage.assetNetwork(
                fit: BoxFit.fill,
                  placeholder: "asset/Image/loading.gif",
                  image: sp.url)
          ),
          Text(sp.ten,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
          Text(sp.gia.toString(),
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
