import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/resource/post_resource.dart';

class ContributorPage extends StatefulWidget {
  const ContributorPage({Key? key}) : super(key: key);

  @override
  State<ContributorPage> createState() => _ContributorPageState();
}

class _ContributorPageState extends State<ContributorPage> {
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
              stream: PostResource.store.stream(),
              builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) { 
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final post = snapshot.data![index];
                      return InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.green
                          ),
                          child: Column(
                            children:  [
                              Text(post.title ?? 'No Title'),
                              Text(post.description ?? 'No Description')
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
