import 'package:flutter/material.dart';

class AppContants {
  static String dateFormat = "yyyy/MM/dd hh:mm aaa";
  //collections
  static String postCollection = "posts";
  static String locationCollection = "locations";
  //routes
  static String homeRoute = "/";
  static String startUpRoute = "/start";
  static String contributorRoute = "/contributor";
  static String postRoute = "/post";
  static String loginRoute = "/login";
  static String signUpRoute = "/signup";
  static String locationRoute = "/location";

  //colors
  static Color backgroundColor = const Color(0xFF011530);
  static Color textFieldColor = const Color(0xFFFFFFFF);
  static Color textColor = Colors.white;
  static Color secondaryColor = const Color(0xFF2D2C2C);
  //Common
  static double toolbarHeight = 70;
  static TextStyle defaultTextStyle = TextStyle(
    color: secondaryColor,
    fontSize: 14
  );

  static String verificationUrl = "https://tourisma-5d4bd.web.app/";

  static List<String> postCategories = [
    "Culture",
    "Tourist Spot", 
    "Heritage", 
  ];
}