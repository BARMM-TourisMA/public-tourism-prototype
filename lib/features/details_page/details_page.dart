//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:public_tourism/common/models/post_model.dart';

import '../../common/constants.dart';
import '../../common/widgets/appbar_user.dart';
import '../../common/widgets/post_heartitem.dart';
import '../../common/widgets/scroll_details.dart';
import '../../resource/post_resource.dart';
//mport 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class ContentDetailsPage extends StatefulWidget {
  const ContentDetailsPage({Key? key}) : super(key: key);

  @override
  State<ContentDetailsPage> createState() => _ContentDetailsPageState();
}

class _ContentDetailsPageState extends State<ContentDetailsPage> {
  late PostModel? post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BuildUser("TouristMA"),
        backgroundColor: const Color(0xFF011530),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 2,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.yellow,
                            image: DecorationImage(
                                image: Image.asset('../assets/tandu.jpg').image,
                                fit: BoxFit.cover)
                            //child
                            ),
                        height: 180,
                        width: 450,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 0, bottom: 4, right: 4, left: 4),
                            child: Text(
                              'Related Pictures and Videos',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: 295,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 0, bottom: 0, right: 16, left: 0),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),



                       SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      
                      height: 70.0,
                      child: StreamBuilder(
                        stream: PostResource.store.stream(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PostModel>> snapshot) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final post = snapshot.data![index];
                                return scroll_details(
                                  imagesheart: post.attachments ?? [],
                                  titleheart: post.title ?? 'No Title',
                                  heartCount1: post.hearts ?? 0,
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
                      ),

                      //color: Color.fromARGB(255, 7, 0, 37),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: SizedBox(
                  height: 2,
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                  ),
                ),
              ),
              
              
            ],
          ),
        ),
                    
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 0, left: 0),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[850],
                        ),
                        height: 50,
                        child: SingleChildScrollView(
                          //scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFF011530),
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: Text(
                                      'Booking',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFF011530),
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: Text(
                                      'Route Place',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFF011530),
                                    ),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 38, left: 4),
                                    child: Text(
                                      'Share Experience',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "The establishment of Bangsamoro was the culmination of several years of peace talks between the Philippine government and several autonomist groups; in particular the Moro Islamic Liberation Front (MILF), which rejected the validity of the ARMM and called for the creation of a region with more powers devolved from the national government. A framework agreement known as the Comprehensive Agreement on the Bangsamoro was negotiated between the Benigno Aquino III administration and the MILF in 2014. After continued negotiations and debates over certain provisions, the Congress of the Philippines created and ratified a basic law for the region, now referred to as the Bangsamoro Organic Law; the bill was signed into law by President Rodrigo Duterte on July 26, 2018. Despite questions on the region's constitutionality, as it would have adopted a parliamentary system in an area of a country with a presidential system of government, no judicial ruling was made against the organic law and consequently the COMELEC held two-part plebiscite: one by ARMM citizens determining whether to dissolve the ARMM and immediately replace it with the Bangsamoro and, following the victory of the yes vote on the first part,[8][9][10] and the second part taken by neighboring municipalities and barangays in the provinces of Lanao del Norte and Cotabato regarding their cession to the Bangsamoro region.[11][12][13][14] As a result of the second part of the plebiscite, 63 barangays of Cotabato province were handed over to the Bangsamoro government, adding to the autonomous region's territory.",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                    width: 460,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
