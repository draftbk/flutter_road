/**
 * Day 6
 * TopBarPage
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';




class MySingleChooseDialog extends StatefulWidget {
  @override
  createState() => MySingleChooseDialogState();
}


class MySingleChooseDialogState extends State<MySingleChooseDialog>{

  int groupValue1;

  ///更新 groupValue1, RadioListTile==groupValue 时候,则按钮被选中
  void updateGroupValue(int e) {
    setState(() {
      groupValue1 = e;
    });
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('我是一个单选 Dialog'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            //value和groupValue值一样的话,则按钮选中
            new RadioListTile<int>(
              title: const Text('A'),
              value: 1,
              activeColor: Colors.red,
              groupValue: groupValue1,
              onChanged: (int e) => updateGroupValue( e),
            ),
            new RadioListTile<int>(
              title: const Text('B'),
              value: 2,
              activeColor: Colors.yellow,
              groupValue: groupValue1,
              onChanged: (int e) => updateGroupValue( e),
            ),
            new RadioListTile<int>(
              title: const Text('C'),
              value: 3,
              activeColor: Colors.green,
              groupValue: groupValue1,
              onChanged: (int e) => updateGroupValue(e),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('确定'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }


}