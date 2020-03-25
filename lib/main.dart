import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(BlocTestApp());

class BlocTestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Bloc Test App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(),
    );
  }
}