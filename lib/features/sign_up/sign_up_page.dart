import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/location_model.dart';
import 'package:public_tourism/common/auth_functions.dart';
import 'package:public_tourism/common/widgets/app_bar.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';
import 'package:public_tourism/resource/location_resource.dart';

import '../../common/text_field_decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode _lastNameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  bool _busy = false;

  String userType = "Explorer";

  @override
  void initState() {
    super.initState();
    _lastNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  void _submitRegistration(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _busy = true;
    });
    signUpWithEmailAndPass(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
            displayName: "${_lastNameCtrl.text}, ${_firstNameCtrl.text}")
        .catchError((e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: const [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Error"),
                ],
              ),
              content: Flex(
                direction: Axis.vertical,
                children: [
                  const Text("Failed to register"),
                  Text("$e"),
                ],
              ),
              backgroundColor: AppContants.secondaryColor,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }).then((value) {
      Navigator.pushReplacementNamed(context, AppContants.startUpRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textWithShadow = AppContants.defaultTextStyle.copyWith(
        color: AppContants.textColor,
        shadows: [
          const BoxShadow(
              color: Colors.black, blurRadius: 2, offset: Offset(2.5, 2.5))
        ].toList());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppContants.backgroundColor,
        appBar: buildAppBar(""),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              StreamBuilder<List<LocationModel>>(
                stream: LocationResource.store.stream(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<LocationModel>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1,
                        autoPlay: true,
                      ),
                      items: snapshot.data!.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(item.image!).image)),
                            );
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return Container(
                      color: AppContants.backgroundColor,
                    );
                  }
                },
              ),
              Container(
                color: const Color.fromARGB(151, 0, 0, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.asset('../assets/wide_logo.png')
                                    .image)),
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "Personal Information:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppContants.textColor),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _firstNameCtrl,
                              style: AppContants.defaultTextStyle,
                              enabled: !_busy,
                              decoration: buildTextFieldDecorator(
                                hintText: 'First Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First is required';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  _lastNameFocusNode.requestFocus();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _lastNameCtrl,
                              focusNode: _lastNameFocusNode,
                              enabled: !_busy,
                              style: AppContants.defaultTextStyle,
                              decoration: buildTextFieldDecorator(
                                hintText: 'Last Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last name is required';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  _emailFocusNode.requestFocus();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "User Account:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppContants.textColor),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _emailCtrl,
                              focusNode: _emailFocusNode,
                              style: AppContants.defaultTextStyle,
                              enabled: !_busy,
                              decoration: buildTextFieldDecorator(
                                hintText: 'eMail',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'eMail is required';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  _passwordFocusNode.requestFocus();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _passwordCtrl,
                              focusNode: _passwordFocusNode,
                              obscureText: true,
                              style: AppContants.defaultTextStyle,
                              enabled: !_busy,
                              decoration: buildTextFieldDecorator(
                                hintText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  _confirmPasswordFocusNode.requestFocus();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _confirmPasswordCtrl,
                              focusNode: _confirmPasswordFocusNode,
                              obscureText: true,
                              enabled: !_busy,
                              style: AppContants.defaultTextStyle,
                              onFieldSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  _submitRegistration(context);
                                }
                              },
                              decoration: buildTextFieldDecorator(
                                hintText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password is required';
                                } else if (value != _passwordCtrl.text) {
                                  return 'Password does not matched';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(5),
                            height: 40,
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: "Explorer",
                                  groupValue: userType,
                                  onChanged: (String? value) {
                                    setState(() {
                                      userType = value!;
                                    });
                                  },
                                ),
                                Center(
                                  child: Text(
                                    'Explorer',
                                    style: textWithShadow,
                                  ),
                                ),
                                Radio<String>(
                                  value: "Contributor",
                                  groupValue: userType,
                                  onChanged: (String? value) {
                                    setState(() {
                                      userType = value!;
                                    });
                                  },
                                ),
                                Center(
                                  child: Text(
                                    'Contributor',
                                    style: textWithShadow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TourButton(
                        label: "SIGN UP",
                        loading: _busy,
                        disabled: _busy,
                        color: AppContants.textFieldColor,
                        onPressed: () => _submitRegistration(context),
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
}
