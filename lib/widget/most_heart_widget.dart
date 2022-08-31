import 'package:flutter/material.dart';

class MostHeart extends StatefulWidget {
  const MostHeart({Key? key}) : super(key: key);

  @override
  State<MostHeart> createState() => _MostHeartState();
}

class _MostHeartState extends State<MostHeart> {
  @override
  Widget build(BuildContext context) {

    return   Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(6),
                  height: 200,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("../assets/tandu.jpg"),
                        fit: BoxFit.fill,
                      )
                      //<-- SEE HERE
                      ),
                  child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 24.0,
                                ),
                              ],
                            ),  
                        ],
                      ),
                  
                );

  }
}
