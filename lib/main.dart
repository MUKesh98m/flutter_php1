import 'package:flutter/material.dart';
import 'package:flutter_php/homepage.dart';
import 'package:flutter_php/login1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api/api_page.dart';
import 'api/data_con.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  void initState() {
    getadata();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter And Php"),
          ),
          body: login1()
        ));
  }
}