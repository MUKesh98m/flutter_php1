import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  String username = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var onchanged = false;

  final _formkey = GlobalKey<FormState>();

  moveTohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        onchanged = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => homepage()));
      setState(() {
        onchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Center(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset("asset/login.png", height: 180),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome $username",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: " Email Id",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          prefixText: '   ',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          username = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "password",
                            prefixIcon: Icon(Icons.password_outlined),
                            hintStyle: TextStyle(
                                // fontFamily: GoogleFonts.fascinate().fontFamily,
                                ),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)))),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 45.0,
                        child: ElevatedButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onPressed: () {
                            insertdata();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }

  Future<void> insertdata() async {
    if (email.text == "" || password.text == "") {
      try{
        String url='';
        var res=await http.post(Uri.pa)

      }
      catch{

      }
    } else {
      Fluttertoast.showToast(msg: "Please Fill All Detail");
    }
  }
}