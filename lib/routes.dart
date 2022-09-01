
import 'package:flutter/cupertino.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/features/contributor/contributor_page.dart';
import 'package:public_tourism/features/contributor/post_page.dart';
import 'package:public_tourism/features/home/home_page.dart';
import 'package:public_tourism/features/log_in/log_in_page.dart';
import 'package:public_tourism/features/sign_up/sign_up_page.dart';
import 'package:public_tourism/features/start_up/start_up_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
    AppContants.startUpRoute: (context) => const StartUpPage(),
    AppContants.homeRoute: (context) => const HomePage(),
    AppContants.contributorRoute: (context) => const ContributorPage(),
    AppContants.postRoute: (context) => const PostPage(),
    AppContants.signUpRoute: (context) => const SignUpPage(),
    AppContants.loginRoute: (context) => const LogInPage()
 };