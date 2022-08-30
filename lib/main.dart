import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/firebase_options.dart';
import 'package:public_tourism/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PublicTourismApp());
}

class PublicTourismApp extends StatelessWidget {
  const PublicTourismApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Tourism App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppContants.homeRoute,
      routes: appRoutes,
    );
  }
}

