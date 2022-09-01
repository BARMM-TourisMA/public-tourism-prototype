import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';

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
              final post = snapshot.data![index];
              return InkWell(
                onTap: () { 
                  Navigator.pushNamed(context, AppContants.detailsRoute);
                },
                child: PostItem(
                    images: post.attachments ?? [],
                    title: post.title ?? 'No Title',
                    heartCount: post.hearts ?? 0,
                    description: post.description ?? 'No Description',
                    date: post.dateUpdated.toString()),
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
    );
  }
}
