import 'package:flutter/material.dart';
import 'package:login_proyect_01/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: RegisterScreen(),
    );
  }
}
