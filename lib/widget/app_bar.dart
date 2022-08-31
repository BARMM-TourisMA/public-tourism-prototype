import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key, double? height}) 
    : super(key: key);

  @override
  //final Size preferredSize; // This didnot work for me.
  Size get preferredSize => preferredSize; //This should work.

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  }

 class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar( title: Text("Sample App Bar") );
  }
  }