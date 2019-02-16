/**
 * Day 5
 * GridView
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';




class Day5 extends StatefulWidget {
  @override
  createState() => Day5State();
}


class Day5State extends State<Day5> {
  List<int> items=[];

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

    Widget basicListSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 200.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                  onTap: (){
                    _showToast(context,"Map");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                  onTap: (){
                    _showToast(context,"Album");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  onTap: (){
                    _showToast(context,"Phone");
                  },
                ),
              ],
            )
        )
    );

    Widget buttonSection = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new RaisedButton(
        onPressed: () {_addListDate();},
        child: new Text("Add New Item"),
      ),
    );

    Widget dynamicSection = Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: 200.0,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return ListTile(
                  leading: Icon(Icons.send),
                  title: new Text("NewItem $index"));
            }
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
          buttonSection,
          dynamicSection
        ]
      )
    );
  }
  void _showToast(BuildContext context,String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }


  void _addListDate(){
    setState(() {
      items.add(1);
    });
  }
}