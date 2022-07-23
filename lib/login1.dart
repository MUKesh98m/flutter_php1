import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/api/data_con.dart';
import 'package:flutter_php/drawer.dart';
import 'package:flutter_php/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/login.png'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "Student Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email, color: Colors.red),
                  contentPadding: EdgeInsets.only(left: 30),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password_sharp, color: Colors.red),
                  contentPadding: EdgeInsets.only(left: 30),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      // insertdata();
                      checklogin();
                    },
                    child: Text("Login")),
              )
            ],
          ),
        ),
      ),
    );
  }

  checklogin() async {
    if (email != "" && password != "") {
      try {
        String url =
            "https://mj09store.000webhostapp.com/register_or_not/check_login.php";
        var res = await http.post(Uri.parse(url),
            body: {"email": email.text, "password": password.text});
        var response = jsonDecode(res.body);
        response.close(force: true);
        print("hi");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => homepage()));
      } catch (e) {
        print(e);

      }
    } else {
      print("by");
    }
  }
}