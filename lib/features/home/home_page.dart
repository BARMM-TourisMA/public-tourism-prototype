import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/resource/post_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInAnonymously().then((value) {
                  if (value.user?.uid != null) {
                    Navigator.pushReplacementNamed(
                        context, AppContants.homeRoute);
                  }
                });
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            StreamBuilder(
              stream: PostResource.store.stream(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PostModel>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text((item.title is String)
                                  ? item.title ?? ''
                                  : "No Title")
                            ],
                          ),
                        ),
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
      ),
    );
  }
}
