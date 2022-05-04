

import 'package:bt1_el/bt_provider/sanpham_provider.dart';
import 'package:bt1_el/gridview/san_pham.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuaThem extends StatefulWidget {
  SuaThem({Key? key,this.spCu}) : super(key: key);
  SanPham? spCu;
  @override
  State<SuaThem> createState() => _SuaThemState();
}

class _SuaThemState extends State<SuaThem> {
  late SanPham spCu = SanPham(url: "", ten: "", gia: 0);
  late String tos;
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _urlCtrl = TextEditingController();
  TextEditingController _giaCtrl = TextEditingController();
  String lableButton = "them";
  bool them = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$lableButton sản phẩm"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(lableButton == "sửa"?  "Update" : "Add", style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red),),
            Row(
              children: [
                Expanded(
                    flex: 9,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      //onSubmitted: (_) => FocusScope.of(context).nextFocus,
                      controller: _nameCtrl,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          label: Text("name"),
                      ),
                      onChanged: (text) {

                      },
                    )),
                TextButton(
                    onPressed: () {
                      _nameCtrl.text = " ";
                    },
                    child: Text("Xóa!"))
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: _giaCtrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Giá')
                    ),
                    onChanged: (text) {

                    },
                  ),),
                TextButton(
                    onPressed: () {
                      _giaCtrl.text = " ";
                    },
                    child: Text("Xóa!"))
              ],
            ),
            lableButton == "thêm"? Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    controller: _urlCtrl,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Url')
                    ),
                    onChanged: (text) {

                    },
                  ),),
                TextButton(
                    onPressed: () {
                      _urlCtrl.text = " ";
                    },
                    child: Text("Xóa!"))
              ],
            ) : Container(),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: lableButton=="sửa"? () {
                      late SanPham? newSp = spCu;
                      //dùng trong sự kiện event như onpress
                      // var provider = context.read<QLSanPham>();
                      //dùng ngoài phương thức build của consumer// thay cho consumer
                      var provider = Provider.of<QLSanPham>(context, listen: false);
                      //dùng bên trong pt build của consumer
                      // var provider = context.watch()<QLSanPham>();
                      newSp.ten = _nameCtrl.text;
                      newSp.gia = double.parse(_giaCtrl.text);
                      provider.update(spCu, newSp);
                      Navigator.of(context).pop;
                    } :
                    (){
                      late SanPham newSp = SanPham(url: '', ten: '', gia: 0);
                      var provider = Provider.of<QLSanPham>(context, listen: false);
                      newSp.ten = _nameCtrl.text;
                      newSp.gia = double.parse(_giaCtrl.text);
                      newSp.url = _urlCtrl.text;
                      provider.add(newSp);
                      Navigator.pop(context);
                    },
                    child: Text("Save")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spCu = widget.spCu ?? spCu;
    if(spCu.url!="" || spCu.gia!=0 || spCu.ten!="")
      {
        lableButton ="sửa";
        _nameCtrl.text = spCu.ten;
        _giaCtrl.text = spCu.gia.toString();
      }
    else
      {
        lableButton = "thêm";
      }
  }
}
