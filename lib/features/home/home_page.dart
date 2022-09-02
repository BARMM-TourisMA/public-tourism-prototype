import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/auth_user_model.dart';
import 'package:public_tourism/common/widgets/post_heartitem.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';
import 'package:public_tourism/widget/latest_post.dart';
//import 'package:public_tourism/widget/most_heart_widget.dart';

import '../../common/models/post_model.dart';
import '../../common/auth_functions.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/appbar_user.dart';
import '../../resource/post_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthUserModel? _currentUser;
  @override
  void initState() {
    super.initState();
    authorizeUser();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (null != user) {
        setState(() {
          _currentUser = currentUser;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentUser == null)
          ? BuildUser("TouristMA")
          : buildAppBar(_currentUser!.displayName, signOutCb: () async {
              await showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Are you sure?"),
                      actions: [
                        TourButton(
                            label: "No",
                            onPressed: () async {
                              Navigator.of(context).pop();
                            }),
                        TourButton(
                          label: "Yes",
                          color: AppContants.secondaryColor,
                          onPressed: () async {
                            await signOutUser()
                                .then((value) => Navigator.of(context).pop());
                            setState(() {
                              authorizeUser();
                            });
                          },
                        ),
                      ],
                    );
                  });
            }),
      backgroundColor: AppContants.backgroundColor,
      body: Column(
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
                margin: const EdgeInsets.only(top: 3),
                alignment: Alignment.bottomLeft,
                child: Text('Most heart posts',
                    style: AppContants.defaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppContants.textColor),
                    textDirection: TextDirection.ltr),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
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
                          child: Text(
                            "No post available",
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 10, right: 10),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.bottomLeft,
            child: Text('Latest posts',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppContants.textColor)),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Card(
                color: Color.fromARGB(255, 11, 1, 56),
                child: LatestPost(),
              ),
            ),
          ),
        ],
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
                //Navigator.pushNamed(context, AppContants.contributorRoute);
              },
              icon: const Icon(
                Icons.apps,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {
                //Navigator.pushNamed(context, AppContants.contributorRoute);
              },
              icon: const Icon(Icons.person, color: Colors.grey))
        ],
      ),
    );
  }
}
