import 'package:flutter/material.dart';

import '../constants.dart';

//import 'package:flutter/material.dart';

//import '../constants.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget BuildUser(String userName) {
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
      children: [
        Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Welcome to",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text("TouristMA"),
                    Text("Bringing BARMM to the realm of digital travellers.",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    
                  ],
                ),
              ],
              //),
              //  ],
            ),
            
          ],
        ),
      ],
    ),
  );
}

