import 'package:flutter/material.dart';

import 'widgets/custom.dart';

void main() async {
  runApp(MaterialApp(
      home: const Home(),
      theme: ThemeData(
          hintColor: const Color.fromARGB(255, 25, 29, 36),
          primaryColor: Colors.white)));
}
