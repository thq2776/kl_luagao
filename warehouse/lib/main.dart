import 'package:flutter/material.dart';
import 'package:warehouse/testapi/testapi_page.dart';
import 'package:warehouse/view/home_page.dart';
import 'package:warehouse/view/login/login_page.dart';
import 'package:warehouse/view/quytrinh/quytrinh_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
