/**
 * Day 2
 * Button
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:core';




class Day4 extends StatefulWidget {
  @override
  createState() => Day4State();
}


class Day4State extends State<Day4> {

  @override
  Widget build(BuildContext context) {

    Widget horizontalListSection = Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );

    Widget basicListSection = Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: (){
              final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
              // Find the Scaffold in the Widget tree and use it to show a SnackBar
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      )
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('ListView'),
      ),
      body: Column(
        children:<Widget>[
          horizontalListSection,
          basicListSection,
        ]

      )
    );
  }
}