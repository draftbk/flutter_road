## Flutter Button 控件
> 实验一些常用的 Button 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day2.dart)

### Button 实验

实验了 Button 常用的一些功能

1. RaisedButton
2. FlatButton
3. FloatingActionButton
4. FloatingActionButton.extended
5. Slider


![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/flutter_load_text.jpeg)

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day2.dart)

#### 遇到的问题

感觉对于控件，各个参数主要是看官网文档，然后自己改改, 所以还是记录一下遇到的问题。

##### 问题一: 当多个 FloatingActionButton 的时候程序运行会黑屏

解决方案：把 **heroTag** 设置为 **null**

```
new FloatingActionButton(
    onPressed: () {print('button click');},
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFFf19670),
    child: new Icon(Icons.add),
    heroTag: null,
),
```
看了官网的说明，大意是 **material design** 建议每个屏幕只有一个 FloatingActionButton，所以如果一定要两个（比如像我这样写demo），就把这个 heroTag 设置为 null。

官网对于 heroTag 的说明: [link](https://docs.flutter.io/flutter/material/FloatingActionButton/heroTag.html)

#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)














