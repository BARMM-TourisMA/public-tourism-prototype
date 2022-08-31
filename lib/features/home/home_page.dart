import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
//import 'package:public_tourism/common/models/post_model.dart';
//import 'package:public_tourism/resource/post_resource.dart';
import 'package:public_tourism/widget/latest_post.dart';
import 'package:public_tourism/widget/most_heart_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 24, 44),
      appBar: AppBar(
        title: const Text("TouristMA"),
        backgroundColor: const Color.fromARGB(255, 0, 24, 44),
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Headline',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Color.fromARGB(255, 7, 0, 37),
                  child: MostHeart(),
                ),
              ),
            ),
            const Text(
              'Demo Headline 2',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
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
      );
    );
  }
}
