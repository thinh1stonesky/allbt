import 'package:flutter/cupertino.dart';

class SanPham
{
  String url;
  String ten;
  double gia;
  bool inCart = false;
  SanPham({required this.url, required this.ten, required this.gia});
}