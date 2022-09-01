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
  static String locationRoute = "/location";

  //colors
  static Color backgroundColor = const Color(0xFF011530);
  static Color textFieldColor = const Color(0xFF00EEEE);
  static Color textColor = Colors.white;
  static Color secondaryColor = const Color(0xFF2D2C2C);
  //Common
  static double toolbarHeight = 70;
  static TextStyle defaultTextStyle = TextStyle(
    color: textColor
  );

  static List<String> postCategories = [
    "Culture",
    "Tourist Spot", 
    "Heritage", 
  ];
}