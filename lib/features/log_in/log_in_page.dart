import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/auth_functions.dart';
import 'package:public_tourism/common/models/location_model.dart';
import 'package:public_tourism/common/widgets/app_bar.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';
import 'package:public_tourism/resource/location_resource.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode _passwordFocusNode;
  void _login(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    signInWithEmailAndPass(email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      Navigator.pushReplacementNamed(context, AppContants.homeRoute);
    }).catchError((e) {
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
                  SizedBox(width: 10,),
                  Text("Error"),
                ],
              ),
              content: Flex(
                direction: Axis.vertical,
                children: [
                  const Text("Failed to login"),
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
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppContants.backgroundColor,
        appBar: buildAppBar(currentUser?.displayName ?? ""),
        body: Column(
          children: [
            SizedBox(
              height: 2,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 10, right: 10),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Bringing BARMM to the realm of digital travelers',
                style: AppContants.defaultTextStyle,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                StreamBuilder<List<LocationModel>>(
                  stream: LocationResource.store.stream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<LocationModel>> snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      final places = snapshot.data!;
                      return Container(
                        height: 200,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppContants.secondaryColor,
                          image: places.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(places.first.image!),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                        child: Stack(
                          children: [
                            if (places.length > 1)
                              CarouselSlider(
                                  items: places.map((location) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.network(location.image!),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: true,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.scale,
                                      autoPlay: true,
                                      viewportFraction: 2.0,
                                      height: 200)),
                          ],
                        ),
                      );
                    } else {
                      return const TourButton(label: "No Available Place Yet");
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          signInWithGoogle().then((credetial) {
                            if (credetial.user != null) {
                              Navigator.pushReplacementNamed(
                                  context, AppContants.homeRoute);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 25,
                        child: Column(
                          children: [
                            Text("OR", style: AppContants.defaultTextStyle)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: 40,
                        width: 350,
                        child: TextFormField(
                          controller: _emailCtrl,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _passwordFocusNode.requestFocus();
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height: 40,
                        width: 350,
                        margin: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 0, left: 0),
                        child: TextFormField(
                          controller: _passwordCtrl,
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _login(context);
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TourButton(
                        label: "LOG IN",
                        icon: Icons.login,
                        textColor: AppContants.secondaryColor,
                        color: AppContants.textFieldColor,
                        onPressed: () => _login(context),
                      ),
                      TourButton(
                        label: "SIGN UP",
                        icon: Icons.app_registration,
                        textColor: Colors.white,
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppContants.signUpRoute);
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
