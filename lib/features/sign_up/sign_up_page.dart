import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //
  bool checkBox1isChecked = false;
  bool checkBox2isChecked = false;
  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF011530),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              height: 200,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              height: 40,
              width: 350,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              height: 40,
              width: 350,
            ),
            const SizedBox(
              height: 8,
            ),
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
            const SizedBox(
              height: 8,
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
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 25, right: 2.5, left: 2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      height: 40,
                      width: 150,
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkBox1isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                checkBox1isChecked = value!;
                              });
                            },
                          ),
                          Center(
                            child: Text('Explorer'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 25, right: 2.5, left: 2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      height: 40,
                      width: 150,
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkBox2isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                checkBox2isChecked = value!;
                              });
                            },
                          ),
                          Center(
                            child: Text('Contributor'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
            )),
          ],
        ),
      ),
    );
  }
}
