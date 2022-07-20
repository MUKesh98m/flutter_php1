import 'dart:convert';
import 'package:flutter_php/api/data_con.dart';
import 'package:http/http.dart' as http;

getadata() async {
  final response =
      await http.get(Uri.https('mj09store.000webhostapp.com', 'get.php'));
  var jsondata = jsonDecode(response.body);
  List<data_con> Data_con = [];
  for (var da in jsondata) {
    // var id = da['id'].toString();
    // var name = da['name'];
    // var age = da['age'].toString();
    data_con user = data_con(
      id: da['id'],
      name: da['name'],
      age: da['age'],
    );
    Data_con.add(user);
  }
  print(Data_con.length);

  return Data_con;
}