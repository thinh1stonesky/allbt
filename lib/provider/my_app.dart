
import 'package:bt1_el/provider/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';
class MyProviderApp extends StatelessWidget {
  const MyProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Counter(),
      child: const MaterialApp(
        title:"ProviderApp",
        home: CounterPage(),
      ),
    );
  }
}
