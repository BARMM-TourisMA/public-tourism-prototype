import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';

class ContributorPage extends StatefulWidget {
  const ContributorPage({Key? key}) : super(key: key);

  @override
  State<ContributorPage> createState() => _ContributorPageState();
}

class _ContributorPageState extends State<ContributorPage> {
  final postsCollection = FirebaseFirestore.instance.collection(AppContants.postCollection);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contributor Page"),
      ),
      body: Center(
        child: Stack(
          children: [
            StreamBuilder(
              stream: postsCollection.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
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
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.home)),
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.apps)),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, AppContants.postRoute);
          }, icon: const Icon(Icons.add_circle)),
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.person))
        ],
      ),
    );
  }
}
