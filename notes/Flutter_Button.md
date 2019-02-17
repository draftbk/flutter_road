## Flutter 学习之路 - Button 控件
> 实验一些常用的 Button 功能 （[代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day2.dart)）

### Button 实验

实验了 Button 常用的一些功能

- RaisedButton
- FlatButton
- 悬浮按钮 （FloatingActionButton）
- 宽的悬浮按钮 （FloatingActionButton.extended）
- 滚动条（Slider）
- 复选框（Checkbox）
- 选项按钮 （Radio Buttons）

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day2.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_button.gif)



#### RaisedButton

用 child 的方式添加文字，用 onPressed 方法监听按钮行为。

```
// RaisedButton
Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
  child: new RaisedButton(
    onPressed: () {print('button click');},
    child: new Text("RaisedButton"),
  ),
),
```

#### FlatButton

和 RaisedButton 一样用 child 的方式添加文字，用 onPressed 方法监听按钮行为。
FlatButton 本身是透明且没有突出的，所以设置了 color 使它更明显


```
// FlatButton
Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
  child: new FlatButton(
      onPressed: () {print('button click');},
      child: new Text("FlatButton"),
      color: Color(0xFFe16552),
  ),
),
```

#### 悬浮按钮 （FloatingActionButton）

悬浮按钮，可以通过改变 child 来设置 button 上显示文字或者 icon。 

同时这里有个要注意的点，就是 **material design** 建议每个屏幕只有一个 FloatingActionButton，所以如果一定要两个（比如像我这样写demo），就要把这个 heroTag 设置为 null。

```
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
```
#### 宽的悬浮按钮 （FloatingActionButton.extended）

可以看我上面的动图，有这个按钮的效果，感觉还挺棒的哈哈。

```
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
```

####  滚动条（Slider）

```
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
```

####  复选框（Checkbox）

```
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
```

#### 选项按钮 （Radio Buttons）

这里如果把新建的 Radio 的值设置为 null, 这个 Radio 就是不可选的，会显示一个灰色的状态。

```
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
```

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














