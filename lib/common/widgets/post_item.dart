import 'package:flutter/material.dart';

import '../constants.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imagePath;
  final int heartCount;
  const PostItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.date,
      required this.heartCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF2D2C2C)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
              child: Stack(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: AppContants.textColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(date,
                        style: TextStyle(
                            fontSize: 10, color: AppContants.textColor))
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: AppContants.textColor),
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppContants.textColor)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(),
                  Column(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text(
                        "$heartCount",
                        style: TextStyle(
                          color: AppContants.textColor,
                          shadows: [const Shadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(2, 2)
                          )].toList()
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        description,
                        style: AppContants.defaultTextStyle,
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
