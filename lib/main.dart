import 'package:flutter/material.dart';
import 'package:led/index/Index.dart';

void main() => runApp(Led());

class Led extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Led',
      debugShowCheckedModeBanner: false,
      home: Index(),
    );
  }
}

