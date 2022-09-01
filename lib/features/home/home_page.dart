import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/widgets/post_heartitem.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';
import 'package:public_tourism/widget/latest_post.dart';
//import 'package:public_tourism/widget/most_heart_widget.dart';

import '../../common/models/post_model.dart';
import '../../common/widgets/app_bar.dart';
//import '../../common/widgets/post_heartitem.dart';
import '../../common/widgets/appbar_user.dart';
import '../../common/widgets/post_item.dart';
import '../../resource/post_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 0, 24, 44),
        appBar: BuildUser("TouristMA"),
        backgroundColor: AppContants.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2,
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    margin: const EdgeInsets.only(top: 6),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Bringing BARMM to the realm of digital travelers',
                      style: AppContants.defaultTextStyle,
                    ),
                  ),
                  
                  // TourButton(

                  //       //color: AppContants.textFieldColor,
                  //       //icon: Icons.add_location_outlined,
                  //       label: "Create Post",
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, AppContants.postRoute);
                  //       },
                  //     ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    margin: const EdgeInsets.only(top: 3),
                    alignment: Alignment.bottomLeft,
                    child: Text('Most heart posts',
                        style: AppContants.defaultTextStyle),
                  ),

                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 200.0,
                      child: StreamBuilder(
                        stream: PostResource.store.stream(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PostModel>> snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final post = snapshot.data![index];
                                return HeartItem(
                                  imagesheart: post.attachments ?? [],
                                  titleheart: post.title ?? 'No Title',
                                  heartCount1: post.hearts ?? 0,
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text("No post available"),
                            );
                          }
                        },
                      ),

                      //color: Color.fromARGB(255, 7, 0, 37),
                    ),
                  ),

                  
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: SizedBox(
                  height: 2,
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.bottomLeft,
                child: Text('Latest posts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppContants.textColor)),
              ),
              const Card(
                color: Color.fromARGB(255, 11, 1, 56),
                child: LatestPost(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, AppContants.contributorRoute);
                },
                icon: const Icon(Icons.add_a_photo)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppContants.contributorRoute);
                },
                icon: const Icon(Icons.apps)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppContants.contributorRoute);
                },
                icon: const Icon(Icons.person))
          ],
        ));
  }
}
