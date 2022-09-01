import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentDetailsPage extends StatefulWidget {
  const ContentDetailsPage({Key? key}) : super(key: key);

  @override
  State<ContentDetailsPage> createState() => _ContentDetailsPageState();
}

class _ContentDetailsPageState extends State<ContentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF011530),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.cyan,
                        ),
                        height: 50,
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'TouristMA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Bringing BARMM to the realm of digital travelers',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.cyan,
                        ),
                        height: 180,
                        width: 450,
                        //child
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
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.cyan,
                        ),
                        height: 56,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < 11; i++) ...[
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF011530),
                                  ),
                                  height: 50,
                                  width: 50,
                                )
                              ],
                            ],
                          ),
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
                          scrollDirection: Axis.horizontal,
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
