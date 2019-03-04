/**
 * Day 5
 * GridView
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

// for HttpClient
import 'dart:convert';
import 'dart:io';

// for http
import 'package:http/http.dart' as http;

// for dio
import 'package:dio/dio.dart';

class Day11 extends StatefulWidget {
  @override
  createState() => Day11State();
}

class Day11State extends State<Day11> {
  String mytext = "Console";
  double buttonWidth = 200;
  String getUrl="httpbin.org/ip";
  String postUrl="ip.taobao.com/service/getIpInfo.php";
  String searchIp='117.89.35.58';
  void setMyTextState(String newText) {
    setState(() {
      mytext = newText;
    });
  }

  void HttpClient_Get() async {
    mytext = "HttpClient GET Start";
    setMyTextState(mytext);
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(getUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        result = await response.transform(utf8.decoder).join();
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }
//  void HttpClient_Post() async {
//    mytext = "HttpClient POST Start";
//    setMyTextState(mytext);
//    var httpClient = new HttpClient();
//    String result;
//    try {
//      Uri uri=new Uri(path:postUrl,queryParameters: {"ip": searchIp} );
//      print(uri.toString());
//      var request = await httpClient.postUrl(uri);
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.OK) {
//        var my_json = await response.transform(utf8.decoder).join();
//        result = my_json.toString();
//      } else {
//        result =
//        'Error getting IP address:\nHttp status ${response.statusCode}';
//      }
//    } catch (exception) {
//      result = 'Failed getting IP address';
//    }
//    mytext = mytext + "\n" + result;
//  }



  void http_Get() async {
    mytext = "http GET Start";
    setMyTextState(mytext);
    String result;
    try {
      var response = await http.get(getUrl);
      if (response.statusCode == HttpStatus.OK) {
        result = response.body;
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }

  void http_Post() async {
    mytext = "http POST Start";
    setMyTextState(mytext);
    String result;
    try {

      var client = http.Client();
      var response = await client.post(postUrl, body: {"ip": searchIp});

      if (response.statusCode == HttpStatus.OK) {
        result = response.body;
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }

  void dio_Get() async {
    mytext = "dio GET Start";
    setMyTextState(mytext);
    String result;
    try {
      Dio dio = new Dio();
      var response = await dio.get(getUrl);
      if (response.statusCode == HttpStatus.OK) {
        result = response.data.toString();
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }

  void dio_Post() async {
    mytext = "dio POST Start";
    setMyTextState(mytext);
    String result="";
    try {
      var dio = new Dio();
      var response = await dio.post(postUrl, queryParameters:{"ip": searchIp});
      if (response.statusCode == HttpStatus.OK) {
        result = response.data.toString();
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }

  void Json_Parser()async {
    mytext = "JSON Parser Start";
    setMyTextState(mytext);
    String result;
    try {
      var client = http.Client();
      var response = await client.post(postUrl, body: {"ip": searchIp});
      if (response.statusCode == HttpStatus.OK) {
        result = response.body;
        var data = json.decode(result);
        result = data['city_id'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    mytext = mytext + "\n" + result;
    setMyTextState(mytext);
  }


  @override
  Widget build(BuildContext context) {
    Widget asyncSection = Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 400.0,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed:  HttpClient_Get,
                child: new Text('HttpClient GET'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: http_Get,
                child: new Text('http GET'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: http_Post,
                child: new Text('http POST'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: dio_Get,
                child: new Text('dio GET'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: dio_Post,
                child: new Text('dio POST'),
                color: Color(0xFFe16552),
              ),
            ),
            new ButtonTheme(
              minWidth: buttonWidth,
              child: RaisedButton(
                onPressed: Json_Parser,
                child: new Text('Json Parser'),
                color: Color(0xFFe16552),
              ),
            ),
          ],
        ),
      ),
    );
    Widget consoleSection = Container(
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
        body: Column(children: <Widget>[
          asyncSection,
          new Container(
            color: Color(0xFFe16552),
            height: 2,
            width: double.infinity,
          ),
          consoleSection,
        ]));
  }
}
