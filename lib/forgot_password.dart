import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/forgot.png'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _email,
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
              SizedBox(
                // width: 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          MailFeedback();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              "Send Mail",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // sendEmail() async {
  //   if (_email != "") {
  //     try {
  //       String url =
  //           "https://mj09store.000webhostapp.com/register_or_not/forgot_email_check.php";
  //       var response =
  //           await http.post(Uri.parse(url), body: {"email": _email.text});
  //
  //       var res = jsonDecode(response.body);
  //
  //       if (response.statusCode == 200) {
  //         // print(response.statusCode);
  //         final Email email = Email(
  //           body:
  //               "https://databases-auth.000webhost.com/sql.php?server=1&db=id19296884_login&table=login&pos=0",
  //           subject: "",
  //           recipients: [_email.text],
  //           // attachmentPaths: ,
  //           isHTML: false,
  //         );
  //       } else {
  //         print(response.statusCode);
  //       }
  //     } catch (e) {
  //       var kk = e.toString();
  //       print(kk);
  //
  //       // }
  //     }
  //   } else {
  //     print("by");
  //   }
  // }
}

Future MailFeedback({message, rating, date}) async {
  final service_id = 'service_ulhew24';
  final template_id = 'template_i6f6myn';
  final user_id = '2n_DsMigCqX6W9H7e';
  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  try {
    var response = await http.post(url,
        headers: {
          'origin': '<http://localhost>',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': service_id,
          'template_id': template_id,
          'user_id': user_id,
          'template_params': {}
        }));
    print('[FEED BACK RESPONSE]');
    print(response.body);
  } catch (error) {
    print('[SEND FEEDBACK MAIL ERROR]');
  }
}