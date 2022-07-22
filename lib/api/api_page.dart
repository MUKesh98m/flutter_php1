import 'dart:convert';
import 'package:flutter_php/api/data_con.dart';
import 'package:http/http.dart' as http;

getadata() async {
  final response = await http.get(Uri.https(
      'mj09store.000webhostapp.com', 'flutter_php_connection/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<data_con> Data_cons = [];
  for (var api in jsondata) {
    data_con Data_con =
        data_con(id: api['id'], name: api['name'], price: api['price']);
    Data_cons.add(Data_con);
  }
  // print(Data_cons.length);
  return Data_cons;
}

getadata1() async {
  final response = await http
      .get(Uri.https('mj09store.000webhostapp.com', 'register_or_not/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<data_con> Data_cons = [];
  for (var api in jsondata) {
    data_con Data_con =
        data_con(id: api['id'], name: api['email'], price: api['password']);
    Data_cons.add(Data_con);
  }
  // print(Data_cons.length);
  return Data_cons;
}