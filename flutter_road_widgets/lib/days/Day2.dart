/**
 * Day 2
 * Button
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';


class Day2 extends StatefulWidget {
  @override
  createState() => Day2State();
}

class Day2State extends State<Day2> {
  var mCurrentValue = 1.0;
  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        children: [
          // RaisedButton
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new RaisedButton(
              onPressed: () {print('button click');},
              child: new Text("RaisedButton"),
            ),
          ),
          // FlatButton
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new FlatButton(
                onPressed: () {print('button click');},
                child: new Text("FlatButton"),
                color: Color(0xFFe16552),
            ),
          ),

          //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // FloatingActionButton
                new FloatingActionButton(
                    onPressed: () {print('button click');},
                    tooltip: 'Increment',
                    backgroundColor: Color(0xFFf19670),
                    child: new Icon(Icons.add),
                ),

                // FloatingActionButton
                new FloatingActionButton(
                    onPressed: () {print('button click');},
                    tooltip: 'Increment',
                    backgroundColor: Color(0xFFf19670),
                    child: new Text("文字"),
                ),
              ],
            ),
          ),

          // FloatingActionButton.extended
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: new FloatingActionButton.extended(
              onPressed: () {
                print('button click');
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
              //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
              icon: new Icon(Icons.flag,color: Colors.red,),
              label: new Text('FloatingActionButton.extended', maxLines: 1),
            )
          ),

          // FloatingActionButton.extended
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: new Slider(
                  value: mCurrentValue,
                  min: 1.0,
                  max: 10.0,
                  onChanged: (e) {
                    setState(() {
                      //四舍五入的双精度值
                      mCurrentValue = e.roundToDouble();
                    });
                  }
              )
          ),



        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Text'),
      ),
      body: buttonSection,

    );
  }
}