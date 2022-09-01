import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/sign_in_functions.dart';
import 'package:public_tourism/firebase_options.dart';
import 'package:public_tourism/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: constant_identifier_names
  const bool USE_EMULATOR =
      String.fromEnvironment('DEV_MODE', defaultValue: '') == 'true';

  if (kIsWeb && USE_EMULATOR) {
    // [Firestore | localhost:8090]
    FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8090',
      sslEnabled: false,
      persistenceEnabled: false,
    );

    //[Authentication | localhost:9099]
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    //[Storage | localhost:9199]
    await FirebaseStorage.instance.useStorageEmulator(
      'localhost',
      9199,
    );
  }
  await authorizeUser();
  runApp(const PublicTourismApp());
}

class PublicTourismApp extends StatelessWidget {
  const PublicTourismApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Tourism App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "Raleway"),
      initialRoute: AppContants.startUpRoute,
      routes: appRoutes,
    );
  }
}
