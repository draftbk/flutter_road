/**
 * Day 2
 * Button
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:core';




class Day3 extends StatefulWidget {
  @override
  createState() => Day3State();
}

class Day3State extends State<Day3> {

  @override
  Widget build(BuildContext context) {

    Widget imageSection = Container(
      padding: const EdgeInsets.all(15.0),
      width: 1000,
      color: Colors.white,
      child: Column(
        children: [
          // Image from internet
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: new Image(
                image:new AssetImage('images/flutter.png'),
                width: 50,
                height: 50,
            ),
          ),
          // Image from internet
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Image.network(
              'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
               scale: 4,
            ),
          ),
          // Gif from internet
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child:Image.network(
              'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/day3/google.gif?raw=true',
              scale: 4,
            ),
          ),

          // FadeInImage
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: FadeInImage.memoryNetwork(
                width: 180,
                height: 180,
                placeholder: kTransparentImage,
                image: 'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
            ),
          ),

          // CachedNetworkImage
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              placeholder: CircularProgressIndicator(),
              imageUrl:
              'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
            ),
          ),



        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Image'),
      ),
      body: imageSection,

    );
  }

}