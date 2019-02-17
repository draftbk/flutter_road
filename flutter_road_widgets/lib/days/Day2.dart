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
  var isChecked=false;
  int groupValue1,groupValue2;
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

          //FloatingActionButton 多个FloatingActionButton的时候会报错，要加 heroTag: null
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // FloatingActionButton
                new FloatingActionButton(
                    onPressed: () {print('button click');},
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFf19670),
                    child: new Icon(Icons.add),
                    heroTag: null,
                ),
                // FloatingActionButton
                new FloatingActionButton(
                    onPressed: () {print('button click');},
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFf19670),
                    child: new Text("文字"),
                    heroTag: null,
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
              icon: new Icon(Icons.flag,color: Colors.red,),
              label: new Text('FloatingActionButton.extended', maxLines: 1),
            )
          ),

          // Slider
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

          // Checkbox
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: new Checkbox(
                  value: isChecked,
                  onChanged: (bool){
                    setState(() {
                      isChecked=bool;
                    });
              }, activeColor: Colors.blue,
              )
          ),

          // Radio
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: new ButtonBar(//ButtonBar：水平排列按钮
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  //value和groupValue值一样的话,则按钮选中
                  new Radio(value: 1,
                      groupValue: groupValue1,
                      onChanged: (int e) => updateGroupValue(e)),
                  new Radio(value: 2,
                      groupValue: groupValue1,
                      onChanged: (int e) => updateGroupValue(e)),
                  new Radio(value: 3,
                      groupValue: groupValue1,
                      onChanged: (int e) => updateGroupValue(e)),
                  new Radio(value: 4,
                      groupValue: groupValue1,
                      onChanged: (int e) => updateGroupValue(e)),
                  //value 值为 null 则表示按钮不可用
                  new Radio(value: null, groupValue: null, onChanged: null)
                ],
              )
          ),

          // Radio
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: new Column(//ButtonBar：水平排列按钮
                children: <Widget>[
                  //value和groupValue值一样的话,则按钮选中
                  new RadioListTile<int>(
                      title: const Text('A'),
                      value: 1,
                      activeColor: Colors.red,
                      groupValue: groupValue2,
                      onChanged: (int e)=>updateGroupValue2(e),
                  ),
                  new RadioListTile<int>(
                    title: const Text('B'),
                    value: 2,
                    activeColor: Colors.yellow,
                    groupValue: groupValue2,
                    onChanged: (int e)=>updateGroupValue2(e),
                  ),
                  new RadioListTile<int>(
                    title: const Text('C'),
                    value: 3,
                    activeColor: Colors.green,
                    groupValue: groupValue2,
                    onChanged: (int e)=>updateGroupValue2(e),
                  ),
                ],
              )
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Button'),
      ),
      body: buttonSection,

    );
  }
  ///更新 groupValue1, 当Radio的value==groupValue 时候,则按钮被选中
  void updateGroupValue(int e){
    setState(() {
      groupValue1=e;
    });
  }
  ///更新 groupValue2, 当Radio的value==groupValue 时候,则按钮被选中
  void updateGroupValue2(int e){
    setState(() {
      groupValue2=e;
    });
  }
}