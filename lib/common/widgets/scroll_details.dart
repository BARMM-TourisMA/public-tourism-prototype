//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScrollDetails extends StatelessWidget {
  final String titleheart;

  final String imagesheart;
  final int heartCount1;

  const ScrollDetails(
      {Key? key,
      required this.titleheart,
      required this.imagesheart,
      required this.heartCount1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(6),
      height: 50,
      width: 50,
      
      decoration: BoxDecoration(
        image: imagesheart.isNotEmpty
            ? DecorationImage(
                image: Image.network(imagesheart).image,
                fit: BoxFit.cover)
            : null,
      ),
    );
  }
}
