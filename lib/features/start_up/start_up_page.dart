
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:public_tourism/common/constants.dart';

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
              ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.signInAnonymously();
                },
                child: const Text('Sign In Anonymously'),
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.Google,
                onPressed: () async {
                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signIn();
                  // Obtain the auth details from the request.
                  final GoogleSignInAuthentication? googleAuth =
                      await googleUser?.authentication;

                  // Create a new credential.
                  final OAuthCredential googleCredential =
                      GoogleAuthProvider.credential(
                    accessToken: googleAuth!.accessToken,
                    idToken: googleAuth.idToken,
                  );

                  // Sign in to Firebase with the Google [UserCredential].
                  await FirebaseAuth.instance
                      .signInWithCredential(googleCredential)
                      .then((googleUserCredential) {
                    if (googleUserCredential.user?.uid != null) {
                      Navigator.pushReplacementNamed(
                          context, AppContants.homeRoute);
                    }
                  });
                },
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.Twitter,
                onPressed: () {},
              )
            ]
          ],
        ),
      ),
    );
  }
}
