/**
 * Day 5
 * GridView
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

// for networks
import 'dart:convert';
import 'dart:io';




class Day11 extends StatefulWidget {
  @override
  createState() => Day11State();
}


class Day11State extends State<Day11> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var my_json = await response.transform(utf8.decoder).join();
        var data = json.decode(my_json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);
    Widget networkingSection =  Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      height: 500.0,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),

    );


    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CupertinoNavigationBar(
          middle: Text('Networking'),
        ),
        body: Column(
            children:<Widget>[
              networkingSection,
            ]
        )
    );
  }
}