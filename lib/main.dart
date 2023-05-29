import 'package:flutter/material.dart';

import 'homescreen.dart';

void main() {
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}