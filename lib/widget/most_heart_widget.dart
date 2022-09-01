import 'package:flutter/material.dart';
import 'package:public_tourism/common/widgets/post_heartitem.dart';

import '../common/models/post_model.dart';
import '../common/widgets/post_item.dart';
import '../resource/post_resource.dart';

class MostHeart extends StatefulWidget {
  const MostHeart({Key? key}) : super(key: key);

  @override
  State<MostHeart> createState() => _MostHeartState();
}

class _MostHeartState extends State<MostHeart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: PostResource.store.stream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
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
              child: Text("No post available",textDirection: TextDirection.rtl,),
            );
          }
        },
      ),
    );
  }
}
