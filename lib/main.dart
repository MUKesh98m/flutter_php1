import 'package:flutter/material.dart';
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
          body: FutureBuilder(
            future: getadata(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Container(
                    child: Text("Data Is Loading Please Wait"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.lenght,
                  itemBuilder: (context, index) {
                     return ListTile(
                      title: Text(snapshot.data[index].id),
                      // subtitle: Text(snapshot.data[index].name),
                      // trailing: Text(snapshot.data[index].age),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}