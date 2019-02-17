## Flutter 学习之路 - Text 控件
> 实验一些常用的 Text 功能 （[代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day1.dart)）

### Text 实验

Text 实验了 Text 常用的一些功能

- 文字大小调整
- 文字颜色设置
- 文字粗体，斜体
- Text 显示的 maxLines 以及 是否换行
- 文字居中
- 文字的装饰（下划线，划去）
- 单词间隙，字母间隙的设置
- 文字点击事件
- 文字拼接

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day1.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_text.gif)


#### Text Style 属性

感觉Text的前面的一些地方都是通过改 Text 的属性，可以直接进入我的代码地址看代码看懂的，这边就放一个属性表。

| 属性  | 意义    |
| ---------- | -----------  |
| fontSize     | 文字大小    | 
| fontWeight   | 文字粗细    | 
| color     | 文字颜色   | 
| fontFamily   | 字体    | 
| fontStyle     | 文字风格（可以设置斜体）    | 
| wordSpacing     | 单词之间的间隙    | 
| letterSpacing     |字母之间的间隙    | 
| locale     |区域设置  | 
| decoration | 文字装饰（例如下划线，上划线，划去的效果）    | 
| decorationStyle  |文字装饰的风格（例如我上面代码实现的波浪线）  | 
| decorationColor     |文字装饰的颜色   | 

#### 文本点击
点击事件改变自己参数的时候要用 setState， 不然直接改 _tapText 界面并不会有反应。

```
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
```

#### 文本拼接

拼接效果可以看上面的动图，感觉拼接是一个很有趣的功能，可以在一段文字里实现不同的功能，或者不同的点击，感觉例如一个英文文档，可以点击不同的文字获取不同的中文翻译这样的功能可以这样实现。

```
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
```

#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










