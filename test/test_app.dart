import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/theme/theme_data.dart';

class TestApp extends StatelessWidget {
  const TestApp({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: child,
      theme: themeData,
    );
  }
}
