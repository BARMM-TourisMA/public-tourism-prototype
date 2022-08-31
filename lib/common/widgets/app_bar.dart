import 'package:flutter/material.dart';

import '../constants.dart';

PreferredSizeWidget buildAppBar(String userName) {
  return AppBar(
    backgroundColor: AppContants.backgroundColor,
    toolbarHeight: AppContants.toolbarHeight,
    leadingWidth: AppContants.toolbarHeight,
    leading: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.yellow,
          image: DecorationImage(
              image: Image.asset('../../web/icons/icon-192.png').image)),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Welcome",
            style: TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          userName,
          style: AppContants.defaultTextStyle,
        ),
      ],
    ),
  );
}
