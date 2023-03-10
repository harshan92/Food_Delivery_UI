import 'package:flutter/material.dart';
import 'package:food_delevery_app/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.light().copyWith(primary: Colors.deepOrangeAccent),
      ),
      home: HomeScreen(),
    );
  }
}
