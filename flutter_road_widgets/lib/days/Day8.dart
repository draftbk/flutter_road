/**
 * Day 1
 * Text
 */


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';


class Day8 extends StatefulWidget {
  @override
  createState() => Day8State();
}

class Day8State extends State<Day8> {
  var _tapText = '文字点击事件, 点我！';

  @override
  Widget build(BuildContext context) {

    Widget textSection = Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        children: [
          Text('默认的Test'),
          //设置字体大小
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '设置字体大小',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          //设置字体颜色
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '设置字体颜色',
              style: TextStyle(
                color: const Color(0xFFFF856C),
              ),
            ),
          ),
          //设置粗体
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '设置粗细和斜体',
              style: TextStyle(
                //字体粗细，粗体和正常
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //设置斜体
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '设置粗细和斜体',
              style: TextStyle(
                //文字样式，斜体和正常
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          //自动换行
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
              '超出屏幕后设置自动换行，来，大声喊：啊啊啊啊啊啊啊啊啊啊啊啊啊啊',
              softWrap: true,
            ),
          ),
          //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
              '超出屏幕后设置用省略号，来，大声喊：啊啊啊啊啊啊啊啊啊啊啊啊啊啊',
              overflow: TextOverflow.ellipsis,
            ),
          ),

          //TextAlign.left左对齐，TextAlign.right右对齐，TextAlign.center居中对齐，TextAlign.justfy两端对齐
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),

            child: Text(
              '文本居中',
              textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '给文字加下划线',
              style: TextStyle(
                //none无文字装饰，lineThrough删除线，overline文字上面显示线，underline文字下面显示线
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.wavy
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              '文字实现划去效果',
              style: TextStyle(
                //none无文字装饰，lineThrough删除线，overline文字上面显示线，underline文字下面显示线
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid
              ),
            ),
          ),
          //单词间隙设置
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
              '单词间隙设置 hello world',
              style: TextStyle(
                wordSpacing: 10.0,
              ),
            ),
          ),
          //字母间隙设置
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Text(
              '字母间隙设置 hello world',
              style: TextStyle(
                letterSpacing: 10.0,
              ),
            ),
          ),
          // 文本点击
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if(_tapText=="啊我被点到了"){
                    _tapText="文字点击事件, 点我！";
                  }else{
                    _tapText="啊我被点到了";
                  }
                });
              },
              child: Text(
                _tapText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 文本拼接
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text.rich(
              new TextSpan(
                  text: '文字拼接: ',
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "文字一",
                        style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            decoration: TextDecoration.none)),
                    new TextSpan(
                        text: "文字二",
                        style: new TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            decoration: TextDecoration.none)),
                    new TextSpan(
                        text: "文字三",
                        style: new TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            decoration: TextDecoration.none)),
                  ]),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CupertinoNavigationBar(
        middle: Text('Text'),
      ),
      body: textSection,

    );
  }
}