import 'package:flutter/material.dart';

class AppContants {
  static String dateFormat = "yyyy/MM/dd hh:mm aaa";
  //collections
  static String postCollection = "posts";
  //routes
  static String homeRoute = "/";
  static String contributorRoute = "/contributor";
  static String postRoute = "/post";

  //colors
  static Color backgroundColor = const Color(0xFF011530);
  static Color textFieldColor = const Color(0xFF00EEEE);
  static Color textColor = Colors.white;
  //Common
  static double toolbarHeight = 70;
  static TextStyle defaultTextStyle = TextStyle(
    color: textColor
  );

  static List<String> postCategories = ["Delicacies", "History", "Culture"];
}