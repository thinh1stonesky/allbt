import 'package:bt1_el/gridview/my_listiew.dart';
import 'package:flutter/material.dart';
import 'san_pham.dart';

class GridviewItem extends StatelessWidget {
  SanPham sp;

  GridviewItem({required this.sp});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.blue,
      child: InkWell(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black38,
              ),
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.fill,
                  placeholder: "asset/Image/loading.gif",
                  image: sp.url),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text(sp.ten,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Positioned(
                left: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.white,),
                      Text(sp.gia.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ListViewTest(),)
          );
        },
      ),
    );
  }
}
