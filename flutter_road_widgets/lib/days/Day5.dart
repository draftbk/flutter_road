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

  List<String> words=["abandon","abhor","abnormal","abroad","abrupt",
  "absent","absorb","abstract","absurd","abundant","abuse","academy"];
  List<String> translations=["放弃","厌恶","反常的","海外","突然的",
  "缺席的","吸收","抽象（的）","不合理的","丰富的","滥用","研究院"];
  Color myColor=Color(0xFFe16552);
  int listNumber=6;

  @override
  Widget build(BuildContext context) {
    Widget gridItem (BuildContext context, int _index) {
      int index=_index%words.length;
      return  Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            setState(() {
              String temp=words[index];
              words[index]=translations[index];
              translations[index]=temp;
            });
          },
          child: Text(
            words[index],
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
          color:myColor,
      );
    }

    Widget gridViewSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            height: 500.0,
            child: GridView.count(
              // 每行有几个子控件
              crossAxisCount: 2,
              // 水平子Widget之间间距
              crossAxisSpacing: 10.0,
              // 水平子Widget之间间距
              mainAxisSpacing: 8.0,
              // 子Widget宽高比例
              childAspectRatio: 2.0,
              children: List.generate(listNumber, (index) {
                return gridItem(context, index);
              }),
            ),
        )
    );


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('GridView'),
      ),
      body: Column(
        children:<Widget>[
          gridViewSection,          // FloatingActionButton.extended
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0.0),
              child: new FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    listNumber=listNumber+1;
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: myColor,
                icon: new Icon(Icons.add,color: Colors.white,),
                label: new Text('添加新单词 ', maxLines: 1),
              )
          ),

        ]
      )
    );
  }
}