import 'package:flutter/material.dart';
import 'package:main_project/dashboard_main.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Welcome to SteamDB 2.0",

      debugShowCheckedModeBanner: false,

      home: Dashboard(),
    );
  }
}
