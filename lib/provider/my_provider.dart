import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends ChangeNotifier{
  int _value = 0;


  int get value => _value;

  Future<int> getValue() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _value = preferences.getInt("Counter") ?? 0;
    return _value;
  }

  void Increment() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //sau khi ghi xong mới nhập nhật
    preferences.setInt("Counter", ++_value).whenComplete(() => notifyListeners());
    notifyListeners();
  }
}