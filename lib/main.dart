import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_ceiba_flutter/infraestructure/entities/user_entity.dart';
import 'package:prueba_ceiba_flutter/theme/theme_data.dart';
import 'package:prueba_ceiba_flutter/widgets/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  runApp(CeibaTestFlutterApp());
}

class CeibaTestFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceiba test',
      theme: themeData,
      home: HomePage(),
    );
  }
}
