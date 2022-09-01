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
              child: Text("No post available"),
            );
          }
        },
      ),
      // margin: const EdgeInsets.all(4),
      // padding: const EdgeInsets.all(6),
      // height: 200,
      // width: 120,
      // decoration: BoxDecoration(
      //     border: Border.all(width: 1),
      //     borderRadius: BorderRadius.circular(20),
      //     image: const DecorationImage(
      //       image: AssetImage("../assets/tandu.jpg"),
      //       fit: BoxFit.fill,
      //     )
      //     //<-- SEE HERE
      //     ),
      // child: Column(
      //       children: [
      //         Row(
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: const <Widget>[
      //               Icon(
      //                 Icons.favorite,
      //                 color: Colors.red,
      //                 size: 24.0,
      //               ),
      //             ],
      //           ),
      //       ],
      //     ),
    );
  }
}
