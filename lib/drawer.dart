import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/login1.dart';
import 'package:flutter_php/register.dart';

class drawer1 extends StatefulWidget {
  const drawer1({Key? key}) : super(key: key);

  @override
  State<drawer1> createState() => _drawer1State();
}

class _drawer1State extends State<drawer1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 400,
              color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 20),
                          child: CircleAvatar(
                            maxRadius: 35,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                              color: Colors.teal,
                              width: 250,
                              child: Text("hi")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Student login(post)"),
              trailing: Icon(Icons.person),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => register()));
              },
            ),
            ListTile(
              title: Text("Student Detail(Get)"),
              trailing: Icon(Icons.details),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => login1()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
