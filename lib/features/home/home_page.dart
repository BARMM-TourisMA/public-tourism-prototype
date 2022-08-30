import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postsCollection = FirebaseFirestore.instance.collection(AppContants.postCollection);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Stack(
          children: [
            StreamBuilder(
              stream: postsCollection.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: const  [
                              Text('Image')
                            ],
                          ),),
                      );
                  },);
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
          IconButton(onPressed: () async {
            Navigator.pushNamed(context, AppContants.contributorRoute);
          }, icon: const Icon(Icons.add_a_photo)),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, AppContants.contributorRoute);
          }, icon: const Icon(Icons.apps)),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, AppContants.contributorRoute);
          }, icon: const Icon(Icons.person))
        ],
      ),
    );
  }
}
