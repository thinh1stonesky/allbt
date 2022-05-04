

import 'package:badges/badges.dart';
import 'package:bt1_el/bt_provider/Suathem_page.dart';
import 'package:bt1_el/bt_provider/sanpham_provider.dart';
import 'package:bt1_el/bt_provider/viewSP_page.dart';
import 'package:bt1_el/gridview/list_sp.dart';
import 'package:bt1_el/gridview/san_pham.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class ChangeLVPage extends StatelessWidget {
  late BuildContext listbuildcontext;
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _giaCtrol = TextEditingController();
  TextEditingController _urlCtrol = TextEditingController();



  @override
  Widget build(BuildContext context) {

    var qlsp = Provider.of<QLSanPham>(context, listen: true);

    // update
    void _onButtonShowModelSheet(SanPham moi, SanPham cu) {
      String ten = cu.ten;
      double gia = cu.gia;
      _nameCtrl.text = ten;
      _giaCtrol.text = gia.toString();
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Update", style: TextStyle(fontSize: 25,
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
                                label: Text("name")
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
                          controller: _giaCtrol,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Giá')
                          ),
                          onChanged: (text) {

                          },
                        ),),
                      TextButton(
                          onPressed: () {
                            _giaCtrol.text = " ";
                          },
                          child: Text("Xóa!"))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            //dùng trong sự kiện event như onpress
                            // var provider = context.read<QLSanPham>();
                            //dùng ngoài phương thức build của consumer
                            var provider = Provider.of<QLSanPham>(context, listen: false);
                            //dùng bên trong pt build của consumer
                            // var provider = context.watch()<QLSanPham>();
                            moi.ten = _nameCtrl.text;
                            moi.gia = double.parse(_giaCtrol.text);
                            print("${cu.gia}, ${moi.gia}");
                            provider.update(moi, cu);
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
            );
          }
      );
    }

    void _onButtonShowModelSheet2(SanPham cu) {
      String ten = cu.ten;
      double gia = cu.gia;
      _nameCtrl.text = ten;
      _giaCtrol.text = gia.toString();
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Update", style: TextStyle(fontSize: 25,
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
                                label: Text("name")
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
                          controller: _giaCtrol,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Giá')
                          ),
                          onChanged: (text) {

                          },
                        ),),
                      TextButton(
                          onPressed: () {
                            _giaCtrol.text = " ";
                          },
                          child: Text("Xóa!"))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            late SanPham newSp = cu;
                            //dùng trong sự kiện event như onpress
                            // var provider = context.read<QLSanPham>();
                            //dùng ngoài phương thức build của consumer// thay cho consumer
                            var provider = Provider.of<QLSanPham>(context, listen: false);
                            //dùng bên trong pt build của consumer
                            // var provider = context.watch()<QLSanPham>();
                            newSp.ten = _nameCtrl.text;
                            newSp.gia = double.parse(_giaCtrol.text);
                            print("${cu.gia}, ${cu.gia}");
                            provider.update(cu, newSp);
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
            );
          }
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage()
                  )
              );
            }
        ),
        actions: [
          InkWell(
              child: Icon(Icons.add, size: 30,),
              onTap: () {
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return Padding(padding: EdgeInsets.all(20),
                //       child: Column(
                //         children: [
                //           Text("Add", style: TextStyle(fontSize: 25,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.red),),
                //           Row(
                //             children: [
                //               Expanded(
                //                   flex: 9,
                //                   child: TextField(
                //                     textInputAction: TextInputAction.next,
                //                     //onSubmitted: (_) => FocusScope.of(context).nextFocus,
                //                     controller: _nameCtrl,
                //                     decoration: const InputDecoration(
                //                         border: OutlineInputBorder(
                //                         ),
                //                         label: Text("name")
                //                     ),
                //                     onChanged: (text) {
                //
                //                     },
                //                   )),
                //               TextButton(
                //                   onPressed: () {
                //                     _nameCtrl.text = " ";
                //                   },
                //                   child: Text("Xóa!"))
                //             ],
                //           ),
                //           const Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 5),
                //           ),
                //           Row(
                //             children: [
                //               Expanded(
                //                 flex: 9,
                //                 child: TextField(
                //                   textInputAction: TextInputAction.done,
                //                   controller: _giaCtrol,
                //                   decoration: const InputDecoration(
                //                       border: OutlineInputBorder(),
                //                       label: Text('Giá')
                //                   ),
                //                   onChanged: (text) {
                //
                //                   },
                //                 ),),
                //               TextButton(
                //                   onPressed: () {
                //                     _giaCtrol.text = " ";
                //                   },
                //                   child: Text("Xóa!"))
                //             ],
                //           ),
                //           const Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 5),
                //           ),
                //           Row(
                //             children: [
                //               Expanded(
                //                 flex: 9,
                //                 child: TextField(
                //                   controller: _urlCtrol,
                //                   textInputAction: TextInputAction.done,
                //                   decoration: const InputDecoration(
                //                       border: OutlineInputBorder(),
                //                       label: Text('Url')
                //                   ),
                //                   onChanged: (text) {
                //
                //                   },
                //                 ),),
                //               TextButton(
                //                   onPressed: () {
                //                     _urlCtrol.text = " ";
                //                   },
                //                   child: Text("Xóa!"))
                //             ],
                //           ),
                //           Padding(padding: EdgeInsets.only(top: 10)),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               ElevatedButton(
                //                   onPressed: () {
                //                     SanPham sanpham = SanPham(
                //                         url: _urlCtrol.text,
                //                         ten: _nameCtrl.text,
                //                         gia: double.parse(_giaCtrol.text));
                //                     var provider = context.read<QLSanPham>();
                //                     provider.add(sanpham);
                //                     Navigator.pop(context);
                //                     _nameCtrl.text = "";
                //                     _giaCtrol.text = "";
                //                     _urlCtrol.text = "";
                //                   },
                //                   child: Text("Save")),
                //               Padding(
                //                   padding: EdgeInsets.symmetric(
                //                       horizontal: 30)),
                //               ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.pop(context);
                //                     _nameCtrl.text = "";
                //                     _giaCtrol.text = "";
                //                     _urlCtrol.text = "";
                //                   },
                //                   child: Text("Cancel")),
                //             ],
                //           )
                //         ],
                //       ),
                //     );
                //   },
                // )
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SuaThem(),)
                )
                ;
              }),
          Padding(padding: EdgeInsets.only(right: 20)),
          Badge(
            badgeContent: Text(qlsp.counterCart.toString()),
            child: Icon(Icons.shopping_cart),
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
        ],

        title: Text("Shopping"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("This is a listview",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25
                ),
              )
          ),
          Consumer<QLSanPham>(
            builder: (context, ql, child) {
              ql.list = sanphams as List<SanPham>;
              listbuildcontext = context;
              return Expanded(
                flex: 1,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(thickness: 2.5,);
                    },
                    itemCount: ql.list.length,
                    itemBuilder: (context, index) {
                      SanPham sp = ql.list[index];
                      return Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                // An action can be bigger than the others.
                                onPressed: (value){
                                   Navigator.of(context).push(
                                     MaterialPageRoute(builder: (context) => ViewSPPage(sp: sp),) );
                                },
                                backgroundColor: Color(0xFF7BC043),
                                foregroundColor: Colors.white,
                                icon: Icons.remove_red_eye,

                              ),
                              SlidableAction(
                                // An action can be bigger than the others.
                                onPressed: (value){
                                  //SanPham newSp = sp;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => SuaThem(spCu: sp),)
                                  );
                                  //sp = newSp;
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(builder: (context) => SuaThem(sp: sp),)
                                  // );
                                },
                                backgroundColor: Color(0xFF7BC043),
                                foregroundColor: Colors.white,
                                icon: Icons.update,
                              ),
                              SlidableAction(
                                onPressed: (context) async{
                                  String? confirm = await _dialogDelete(listbuildcontext, "ban muon xoa san pham ${sp.ten}");
                                  if(confirm == "ok"){
                                    var provider = listbuildcontext.read<QLSanPham>();
                                    provider.delete(index);
                                  }
                                },
                                backgroundColor: Color(0xFF0392CF),
                                foregroundColor: Colors.white,
                                icon: Icons.save,
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(sp.url),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(sp.ten,
                                      style: TextStyle(color: Colors.black87),),
                                    Text(sp.gia.toString(),
                                      style: TextStyle(color: Colors.black87),),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    var provider = context.read<QLSanPham>();
                                    sp.inCart == true ? provider.Decrement(): provider.Increment();
                                    sp.inCart = !sp.inCart;
                                  },
                                  splashColor: Colors.transparent,
                                  child: SizedBox(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        sp.inCart == false ? Text("Add"): Text("Remove"),
                                        Icon(Icons.shopping_cart)
                                      ],
                                    ),
                                  ),

                                )
                              ],

                            )
                          ));
                    }
                ),
              );
            },
          ),
        ],
      ),
    );


  }

  void doNothing(BuildContext context) {
    print("sdf");
  }

  void _onpenDialog(BuildContext context, int index) {
    var dialog = AlertDialog(
      title: Text('Thông báo'),
      content: Text("Bạn muốn xóa ư?"),

      actions: [
        ElevatedButton(onPressed: () {
          var provider = context.read<QLSanPham>();
          provider.delete(index);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChangeLVPage(),)
          );
        },
            child: Text("Delete")
        ),
        ElevatedButton(onPressed: () {
          Navigator.of(context).pop("Cancel");
        },
          child: Text("Cancel"),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }


  void HienthiDialog(BuildContext context) {
    var dialog = AlertDialog(
      title: Text('Thông báo'),
      content: Text("Bạn muốn xóa ư?"),

      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            child: Text("Ok")
        ),

      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  Future _dialogDelete( BuildContext context, String tb) async {
    var dialog = AlertDialog(
      title: Text('Thông báo'),
      content: Text(tb),

      actions: [
        ElevatedButton(onPressed: (){
          // var provider = context.read<QLSanPham>();
          //provider.delete(index);
          Navigator.of(context, rootNavigator: true).pop("ok");
        },
            child: Text("Delete")
        ),
        ElevatedButton(onPressed: (){
          Navigator.of(context, rootNavigator: true).pop("cancel");
        },
            child: Text("Cancel")
        ),

      ],
    );
    String? res = await showDialog<String>(
      //barrierDismissible: false,
        context: context,
      builder: (context) => dialog,
    );
    return res;

  }




}
