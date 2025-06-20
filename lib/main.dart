import 'package:card/features/home/views/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  getData();
}
final Dio dio =Dio();
getData() async{
  var response=  await dio.get("https://fakestoreapi.com/products");

  print( response.data);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

