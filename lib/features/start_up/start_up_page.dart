
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  User? currentUser;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (null != user) {
        setState(() {
          currentUser = user;
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            if (null != currentUser) ...[
              Text(currentUser!.displayName ?? currentUser!.uid),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AppContants.homeRoute);
                },
                child: const Text('Explore Now'),
              )
            ] else ...[
              TourButton(
                icon: Icons.login,
                color: AppContants.textFieldColor,
                textColor: AppContants.secondaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppContants.loginRoute);
                },
                label: 'Sign In',
              ),
            ]
          ],
        ),
      ),
    );
  }
}
