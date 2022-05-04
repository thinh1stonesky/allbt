import 'package:bt1_el/gridview/san_pham.dart';
import 'package:flutter/cupertino.dart';
import '../gridview/list_sp.dart';
class QLSanPham extends ChangeNotifier{
  late List<SanPham> _list;
  int _counterCart = 0;

  int get counterCart => _counterCart;

  set list(List<SanPham> value) {
    _list = value;
  }

  List<SanPham> get list => _list;

  void Increment(){
    _counterCart++;
    notifyListeners();
  }
  void Decrement(){
    _counterCart--;
    notifyListeners();
  }

  void delete(int index)
  {
    _list.removeAt(index);
    notifyListeners();
  }

  void add(SanPham sp)
  {
    _list.add(sp);
    notifyListeners();
  }

  void update(SanPham cu, SanPham moi)
  {
    cu.gia = moi.gia;
    cu.ten = moi.ten;
    notifyListeners();
  }
}