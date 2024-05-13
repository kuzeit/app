import 'package:flutter/material.dart';
import 'dart:math';

import 'flower_page.dart';

void main() {
  runApp(FlowerApp());
}

class FlowerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowerPage(),
    );
  }
}


