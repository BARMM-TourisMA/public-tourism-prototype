import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/widgets/app_bar.dart';

import '../../common/text_field_decoration.dart';

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
        backgroundColor: AppContants.backgroundColor,
        appBar: buildAppBar(""),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset('../assets/wide-logo.png').image)
                    ),
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Personal Information:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppContants.textColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: buildTextFieldDecorator(
                            hintText: 'First Name',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: buildTextFieldDecorator(
                            hintText: 'Last Name',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "User Account:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppContants.textColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: buildTextFieldDecorator(
                            hintText: 'Username',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: buildTextFieldDecorator(
                            hintText: 'Password',
                          ),
                        ),
                      ],
                    ),
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
                                const Center(
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
                                const Center(
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
                        color: AppContants.secondaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
