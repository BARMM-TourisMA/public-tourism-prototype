import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/constants.dart';
import 'package:public_tourism/common/models/location_model.dart';
import 'package:public_tourism/common/models/post_model.dart';
import 'package:public_tourism/common/widgets/app_bar.dart';
import 'package:public_tourism/common/widgets/post_item.dart';
import 'package:public_tourism/common/widgets/tour_button.dart';
import 'package:public_tourism/features/contributor/floating_modal.dart';
import 'package:public_tourism/resource/location_resource.dart';
import 'package:public_tourism/resource/post_resource.dart';

class ContributorPage extends StatefulWidget {
  const ContributorPage({Key? key}) : super(key: key);

  @override
  State<ContributorPage> createState() => _ContributorPageState();
}

class _ContributorPageState extends State<ContributorPage> {
  bool showTapPosts = false;
  Widget buildLocationOption({required String label, required Image image}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: image.image,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          //style: AppContants.defaultTextStyle,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Some user"),
      backgroundColor: AppContants.backgroundColor,
      body: Column(children: [
        SizedBox(
          height: 2,
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 10, right: 10),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Bringing BARMM to the realm of digital travelers',
            style: AppContants.defaultTextStyle,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    TourButton(
                      color: AppContants.textFieldColor,
                      icon: Icons.filter_1,
                      label: "Select Location",
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          anchorPoint: const Offset(0, 0),
                          builder: (context) => FloatingModal(
                            backgroundColor: const Color(0x55FFFFFF),
                            child: StreamBuilder<List<LocationModel>>(
                              stream: LocationResource.store.stream(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<LocationModel>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        for (final loc in snapshot.data!) ...[
                                          const SizedBox(width: 10),
                                          buildLocationOption(
                                              label: loc.title ?? 'No Title',
                                              image: Image.network(
                                                  loc.image ?? 'no-image'))
                                        ]
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Center(
                                      child: Text("No Place available"));
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    TourButton(
                      color: AppContants.textFieldColor,
                      icon: Icons.add_location_outlined,
                      label: "Create Post",
                      onPressed: () {
                        Navigator.pushNamed(context, AppContants.postRoute);
                      },
                    ),
                    SizedBox(
                      height: 2,
                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
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
                              description: post.description ?? 'No Description',
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
              ),
            ]),
          ),
        )
      ]),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.apps)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppContants.postRoute);
              },
              icon: const Icon(Icons.add_circle)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ],
      ),
    );
  }
}
