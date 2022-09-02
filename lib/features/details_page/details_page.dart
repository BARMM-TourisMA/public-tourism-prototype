import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/common/auth_functions.dart';
import 'package:public_tourism/common/widgets/app_bar.dart';
import '../../common/widgets/appbar_user.dart';
import '../../common/widgets/scroll_details.dart';
import '../../resource/post_resource.dart';

class ContentDetailsPage extends StatefulWidget {
  const ContentDetailsPage({Key? key}) : super(key: key);

  @override
  State<ContentDetailsPage> createState() => _ContentDetailsPageState();
}

class _ContentDetailsPageState extends State<ContentDetailsPage> {
  late PostModel post;
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as PostModel?;
    if (arg != null) {
      post = arg;
    } else {
      Navigator.pop(context);
      return Container();
    }
    return SafeArea(
      child: Scaffold(
        appBar: (currentUser == null)
            ? BuildUser("TouristMA")
            : buildAppBar(currentUser!.displayName),
        backgroundColor: const Color(0xFF011530),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 2,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      if (null != post.attachments &&
                          post.attachments!.length > 1)
                        CarouselSlider(
                          options: CarouselOptions(
                            //height: MediaQuery.of(context).size.height,
                            height: 180,
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                          items: post.attachments!.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(item).image)),
                                );
                              },
                            );
                          }).toList(),
                        )
                      else
                        Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.yellow,
                              image: DecorationImage(
                                  image: (null != post.attachments &&
                                          post.attachments!.isNotEmpty)
                                      ? Image.network(post.attachments!.first)
                                          .image
                                      : Image.asset('../assets/tandu.jpg')
                                          .image,
                                  fit: BoxFit.cover)
                              //child
                              ),
                          height: 180,
                          width: 450,
                        ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 0, bottom: 4, right: 4, left: 4),
                            child: const Text(
                              'Related Pictures and Videos',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: 295,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 0, bottom: 0, right: 16, left: 0),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            //Related
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70.0,
                                  child: ListView.builder(
                                    itemCount: post.attachments!.length,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ScrollDetails(
                                        imagesheart: post.attachments![index],
                                        titleheart: post.title ?? 'No Title',
                                        heartCount1: post.hearts ?? 0,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: SizedBox(
                                height: 2,
                                child: Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 0, left: 0),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[850],
                        ),
                        height: 50,
                        child: SingleChildScrollView(
                          //scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppContants.backgroundColor,
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: const Text(
                                      'Booking',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppContants.backgroundColor,
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: const Text(
                                      'Route Place',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppContants.backgroundColor,
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: const Text(
                                      'Share Experience',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: const Text(
                                      "Description",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.all(4),
                                    width: 460,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            post.description ??
                                                "No Description",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
