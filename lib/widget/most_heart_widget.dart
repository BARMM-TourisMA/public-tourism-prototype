//import 'package:flutter/cupertino.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
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

                  height: 200,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                      image: new DecorationImage(
                        image: new AssetImage("../assets/tandu.jpg"),
                        fit: BoxFit.fill,
                      )
                      //<-- SEE HERE
                      ),
                  
                );
                  
      


  }
}