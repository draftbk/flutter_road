/**
 * Day 5
 * GridView
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';





class Day10 extends StatefulWidget {
  @override
  createState() => Day10State();
}


class Day10State extends State<Day10> {
  String mytext="Console";
  void thenCatch(){
    mytext="Started";
    setMyTextState(mytext);
    // then 用来说明 2 second 后做什么
    Future.delayed(Duration(seconds: 1)).then((_){
      // 当运行完成
      mytext = mytext + "\n" + "Completed Task1";
      setMyTextState(mytext);
    }).catchError((e){
      // 当运行失败
//        print('failed: ${e.toString()}');
      mytext=mytext+"\n"+'failed: ${e.toString()}';
      setMyTextState(mytext);
    });

  }

  void setMyTextState(String newText){
    setState(() {
      mytext=newText;
    });
  }

  Future<void> asyncAwait() async{
    mytext="Started";
    setMyTextState(mytext);
    try{
      // 这里没有 .then, 要加 await, await 是说在 await 完成前别往下执行
      await Future.delayed(Duration(seconds: 1));
      mytext=mytext+"\n"+"Completed Task1";
      setMyTextState(mytext);
      await Future.delayed(Duration(seconds: 1));
      mytext=mytext+"\n"+"Completed Task2";
      setMyTextState(mytext);
    }catch(e){
      print('failed: ${e.toString()}');
    }
  }

  Future<void> asyncNoAwait() async{
    mytext="Started";
    setMyTextState(mytext);
    try{
      // 这里没有 .then, 要加 await, await 是说在 await 完成前别往下执行
      Future.delayed(Duration(seconds: 2));
      mytext=mytext+"\n"+"Completed Task1";
      setMyTextState(mytext);
      Future.delayed(Duration(seconds: 1));
      mytext=mytext+"\n"+"Completed Task2";
      setMyTextState(mytext);
    }catch(e){
      print('failed: ${e.toString()}');
    }
  }

  Future<void> asyncAwaitWithTask() async{
    mytext="Started";
    setMyTextState(mytext);
    try{
      // 这里没有 .then, 要加 await, await 是说在 await 完成前别往下执行
      await Future.delayed(Duration(seconds: 1));
      mytext=mytext+"\n"+"Completed Task1";
      setMyTextState(mytext);
      task2();
      mytext=mytext+"\n"+"Completed Task3";
      setMyTextState(mytext);
      mytext=mytext+"\n"+"Completed Task4";
      setMyTextState(mytext);
    }catch(e){
      print('failed: ${e.toString()}');
    }
  }

  void task2() async{
    await Future.delayed(Duration(seconds: 1));
    mytext=mytext+"\n"+"Completed Task2";
    setMyTextState(mytext);
  }


  @override
  Widget build(BuildContext context) {

    Widget networkingSection =  Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 500.0,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: thenCatch,
              child: new Text('Then'),
            ),
            new RaisedButton(
              onPressed: asyncNoAwait,
              child: new Text('Async no await'),
            ),
            new RaisedButton(
              onPressed: asyncAwait,
              child: new Text('Async await'),
            ),
            new RaisedButton(
              onPressed: asyncAwaitWithTask,
              child: new Text('Wait With Other Task'),
            ),
          ],
        ),
      ),

    );


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Async'),
      ),
      body: Column(
        children:<Widget>[
          networkingSection,
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
            mytext,
            maxLines: 6,
            ),
          ),
        ]
      )
    );
  }
}