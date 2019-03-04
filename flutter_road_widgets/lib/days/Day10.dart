/**
 * Day 10
 * Async
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
    // then 用来说明 1 second 后做什么
    Future.delayed(Duration(seconds: 1)).then((_){
      // 当运行完成
      mytext = mytext + "\n" + "Completed Task1";
      setMyTextState(mytext);
    }).catchError((e){
      // 当运行失败
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

    Widget asyncSection =  Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 400.0,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: thenCatch,
              child: new Text('Future.Then'),
              color: Color(0xFFe16552),
            ),
            new RaisedButton(
              onPressed: asyncNoAwait,
              child: new Text('Async no await'),
              color: Color(0xFFe16552),
            ),
            new RaisedButton(
              onPressed: asyncAwait,
              child: new Text('Async await'),
              color: Color(0xFFe16552),
            ),
            new RaisedButton(
              onPressed: asyncAwaitWithTask,
              child: new Text('Wait With Other Task'),
              color: Color(0xFFe16552),
            ),
          ],
        ),
      ),
    );
    Widget consoleSection =  Container(
       margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
       height: 300.0,
       width: double.infinity,
       child: Text(
         mytext,
         style: TextStyle(
           fontSize: 18,
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
          asyncSection,
          new Container(
          color: Color(0xFFe16552),
          height: 2,
          width: double.infinity,
          ),
          consoleSection,
        ]
      )
    );
  }
}