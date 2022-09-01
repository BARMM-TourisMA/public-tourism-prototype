import 'package:flutter/material.dart';

import '../common/models/post_model.dart';
import '../common/widgets/post_item.dart';
import '../resource/post_resource.dart';

class LatestPost extends StatelessWidget {
  const LatestPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: PostResource.store.stream(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = snapshot.data![index];
              return InkWell(
                onTap: () {},
              
               
                  //           ? item.title ?? ''
                  //           : "No Title"),
                  //     ],
                  //   ),
                  child: StreamBuilder(
                    stream: PostResource.store.stream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PostModel>> snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final post = snapshot.data![index];
                            return PostItem(
                                images: post.attachments ?? [],
                                title: post.title ?? 'No Title',
                                heartCount: post.hearts ?? 0,
                                description:
                                    post.description ?? 'No Description',
                                date: post.dateUpdated.toString());
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("No post available"),
                        );
                      }
                    },
                  ),
                //),
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
