import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';

import '../constants.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final List<String> images;
  final int heartCount;
  final VoidCallback? onPressed;
  final VoidCallback? onHearted;
  const PostItem(
      {Key? key,
      required this.images,
      required this.title,
      required this.description,
      required this.date,
      required this.heartCount,
      this.onPressed,
      this.onHearted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppContants.secondaryColor),
        child: Column(
          children: [
            //Header
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
            //Body
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(right: 10, top: 10),
              decoration: BoxDecoration(
                color: AppContants.secondaryColor,
                image: images.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(images.first), fit: BoxFit.cover)
                    : null,
              ),
              child: Stack(
                children: [
                  if (images.length > 1)
                    CarouselSlider(
                        items: images.map((url) {
                          return Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.network(url),
                          );
                        }).toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            viewportFraction: 1.0,
                            height: 200)),
                  Column(
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
                                shadows: [
                                  const Shadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: Offset(2, 2))
                                ].toList()),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Footer
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Author:",
                    style: AppContants.defaultTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        description,
                        style: AppContants.defaultTextStyle
                            .copyWith(color: Colors.white),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ),
            //Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TourButton(
                    color: AppContants.secondaryColor,
                    textColor: Colors.white,
                    label: "Details",
                    icon: Icons.info_outline_rounded,
                    onPressed: onPressed),
                TourButton(
                    color: AppContants.secondaryColor,
                    label: "",
                    textColor: Colors.red,
                    icon: Icons.favorite,
                    onPressed: onHearted)
              ],
            )
          ],
        ));
  }
}
