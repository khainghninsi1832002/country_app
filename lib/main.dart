import 'package:country_app/api/api_service.dart';
import 'package:country_app/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  final dio = Dio(); // Create a Dio instance

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
