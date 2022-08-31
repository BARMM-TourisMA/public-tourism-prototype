// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/common/models/upload_progress_model.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';

import '../../common/widgets/app_bar.dart';

class PostPage extends StatefulWidget {
  final PostModel? post;
  const PostPage({
    Key? key,
    this.post,
  }) : super(key: key);
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postCollection =
      FirebaseFirestore.instance.collection(AppContants.postCollection);
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<UploadProgressModel<dynamic>> _images = [];
  late FocusNode descFocusNode;
  bool isBusy = false;

  @override
  void initState() {
    super.initState();
    descFocusNode = FocusNode();
  }

  void _pickImages() async {
    if (kIsWeb) {
      final fileImages = await ImagePickerWeb.getMultiImagesAsFile();
      if (null != fileImages) {
        setState(() {
          _images.clear();
          _images.addAll(fileImages.map(
              (e) => UploadProgressModel(data: e, title: e.name, progress: 0)));
        });
      }
    } else {
      final picker = ImagePicker();
      final fileImages = await picker.pickMultiImage();
      if (null != fileImages) {
        setState(() {
          _images.clear();
          _images.addAll(fileImages.map(
              (e) => UploadProgressModel(data: e, title: e.name, progress: 0)));
        });
      }
    }
  }

  void _uploadPost() async {
    if (!_formKey.currentState!.validate() || _images.isEmpty) return;
    setState(() {
      isBusy = true;
    });
    final post = PostModel(
        title: _titleCtrl.text,
        description: _descriptionCtrl.text,
        attachments: []);
    var doc = await postCollection.add(post.toMap());
    final storeInstance = FirebaseStorage.instance;
    final urls =
        await Future.wait(_images.map((UploadProgressModel progress) async {
      final index = _images.indexOf(progress);
      late UploadTask task;
      late Reference snapshot;
      if (kIsWeb) {
        final info = progress.data;
        snapshot =
            storeInstance.ref().child('images/${doc.id}/${info.name}');
        task = snapshot.putBlob(
            info.slice(), SettableMetadata(contentType: info.type));        
      } else {
        final xfile = progress.data as XFile;
        snapshot =
            storeInstance.ref().child('images/${doc.id}/${xfile.name}');
        final bytes = await xfile.readAsBytes();
        task = snapshot.putData(bytes, SettableMetadata(contentType: xfile.mimeType));
      }
      task.snapshotEvents.listen((snap) {
        double value =
            snap.bytesTransferred.toDouble() / snap.totalBytes.toDouble();

        if (snap.state != TaskState.error) {
          setState(() {
            _images.setRange(index, index + 1,
                [progress.copyWith(progress: value)].toList());
          });
        }
      });
      await task;
      return await snapshot.getDownloadURL();
    }));

    postCollection
        .doc(doc.id)
        .set(post.copyWith(attachments: urls).toMap())
        .then((_) {
      Navigator.pop(context);
    });
  }

  Widget get progress {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_images.isEmpty) ...const [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Please attach atleast one image",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
          for (var item in _images) ...[
            if (isBusy)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: item.progress,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                    backgroundColor: const Color(0xffD6D6D6),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(color: AppContants.secondaryColor, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "${item.title} ${isBusy ? '${(100 * item.progress).round()}%' : ''}",
                style: AppContants.defaultTextStyle,
              ),
            )
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Juan dela Cruz"),
        backgroundColor: AppContants.backgroundColor,
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Article",
                        style: TextStyle(
                            color: AppContants.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        enabled: !isBusy,
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            descFocusNode.requestFocus();
                          }
                        },
                        controller: _titleCtrl,
                        decoration: InputDecoration(
                          hintText: "Title",
                          fillColor: AppContants.textFieldColor,
                          filled: true,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _descriptionCtrl,
                        maxLines: 6,
                        enabled: !isBusy,
                        focusNode: descFocusNode,
                        decoration: InputDecoration(
                          hintText: "Description",
                          fillColor: AppContants.textFieldColor,
                          filled: true,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Description';
                          }
                          return null;
                        },
                      ),
                      Expanded(child: SingleChildScrollView(child: progress,)),
                    ],
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TourButton(
                        color: Colors.transparent,
                        onPressed: () => Navigator.pop(context),
                        disabled: isBusy,
                        label: "Cancel\nPost"),
                    TourButton(
                        onPressed: _pickImages,
                        color: Colors.black,
                        textColor: Colors.white,
                        icon: Icons.image,
                        disabled: isBusy,
                        label: "Attach Image"),
                    TourButton(
                      onPressed: _uploadPost,
                      color: Colors.transparent,
                      label: "Submit\nPost",
                      loading: isBusy,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )
          ],
        ));
  }
}
