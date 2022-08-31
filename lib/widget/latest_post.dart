import 'package:flutter/material.dart';

import '../common/models/post_model.dart';
import '../resource/post_resource.dart';

class LatestPost extends StatelessWidget {
  const LatestPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(3),
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                             // color: Colors.green,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                       AssetImage("../assets/tandu.jpg"),
                                    fit: BoxFit.fill,
                                  )
                                  //<-- SEE HERE
                                  ),
                            ),
                            Text((item.title is String)
                                ? item.title ?? ''
                                : "No Title"),
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
       
    );
  }
}
