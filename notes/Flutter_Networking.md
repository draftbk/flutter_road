## Flutter 学习之路 - 网络
> 实验一些 Flutter 的网络方面的功能 （[代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day10.dart)）

### Button 实验

实验了 Button 常用的一些功能

- RaisedButton
- FlatButton
- 悬浮按钮 （FloatingActionButton）
- 宽的悬浮按钮 （FloatingActionButton.extended）
- 滚动条（Slider）
- 复选框（Checkbox）
- 选项按钮 （Radio Buttons）

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day10.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_button.gif)



#### POST 请求

先添加一些库

```
import 'dart:convert';
import 'dart:io';
```
学习的 Flutter 中文网上面的例子，只不过代码有一些小错要改，应该是版本改了，现在调用 utf8, json 都是需要小写。

```
var json = await response.transform(UTF8.decoder).join();
var data = JSON.decode(json);
改写成：
var my_json = await response.transform(utf8.decoder).join();
var data = json.decode(my_json);
```

对 _getIPAddress() 方法加上一些注释和分析：



#### 遇到的问题



#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)














