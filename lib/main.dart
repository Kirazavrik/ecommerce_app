import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ecommerce app',
      theme: ThemeData(
          fontFamily: 'Mark Pro',
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color(0xff010035), secondary: Color(0xffff6e4e)),
        scaffoldBackgroundColor: Color(0xffE5E5E5)
      ),
      home: HomePage(),
    );
  }
}
