// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';

import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';

class PostPage extends StatefulWidget {
  final PostModel? post;
  const PostPage({
    Key? key, this.post,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postCollection = FirebaseFirestore.instance.collection(AppContants.postCollection);
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: const Text("New Post")),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleCtrl,
                        decoration: const InputDecoration(labelText: "Title"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionCtrl,
                        decoration:
                            const InputDecoration(labelText: "Description"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TourButton(
                  onPress: () {
                    final post = PostModel(
                      title: _titleCtrl.text,
                      description: _descriptionCtrl.text
                    );
                    postCollection.add(post.toMap())
                      .then((value) {
                        Navigator.pop(context);
                      });
                  },
                  color: Colors.black, 
                  text: "Post", 
                  icon: Icons.add_a_photo)
              ],
            )
          ],
        ));
  }
}
