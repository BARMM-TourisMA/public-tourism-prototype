import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF011530),
        //appBar: AppBar(title: Text('Log In Page')),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.cyan,
                  ),
                  height: 50,
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'TouristMA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Bringing BARMM to the realm of digital travelers',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.cyan,
                  ),
                  height: 180,
                  width: 400,
                  //child
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                      height: 40,
                      width: 350,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      height: 40,
                      width: 350,
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 0, right: 0, left: 0),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (() {
                        //
                      }),
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text('LOG IN'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: (() {
                  //
                }),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF011530),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
