
import 'package:flutter/cupertino.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/features/home/home_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
    AppContants.homeRoute: (context) => const HomePage()
 };