## Flutter 学习之路 - Listview
> 实验一些常用的 List 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day4.dart)

### Listview 实验

实验了 Listview 常用的一些功能

- 实现水平的 Listview
- 给Listview item 加上点击事件
- Listview 动态更新

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day4.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_listview.gif)

#### 实现水平的 Listview

把属性 scrollDirection 设置为 Axis.horizontal 就能水平了，真的好方便。下面的代码为了避免太长我就选了一部分，实际上children还要多才有效果，可以看我 github 上的源码，或者自己加几个就好了。


```
 child: ListView(
   scrollDirection: Axis.horizontal,
   children: <Widget>[
     Container(
       width: 160.0,
       color: Colors.red,
     ),
     Container(
       width: 160.0,
       color: Colors.blue,
     ),
     // Add more childre
   ],
 ),
```

#### 给 Listview item 加上点击事件

点击事件感觉和处在 listview 里的 children 有关，children 是怎么设置点击事件，就按它的设置就好。

```
child: ListView(
  children: <Widget>[
    ListTile(
      leading: Icon(Icons.map),
      title: Text('Map'),
      onTap: (){
        _showToast(context,"Map");
      },
    ),
  ],
)
```

##### Listview 动态更新
用 ListView.builder 以及  一个外部的 List<int>, 然后写一个方法更新 List 的值

```
List<int> items=[];
// show listview by item
Widget dynamicSection = Container(
    margin: EdgeInsets.symmetric(vertical: 5.0),
    height: 200.0,
    child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return ListTile(
              leading: Icon(Icons.send),
              title: new Text("NewItem $index"));
        }
    )
);
// modify items
void _addListDate(){
  setState(() {
    items.add(1);
  });
}
```


#### 遇到的问题

记录一下遇到的问题。

##### 问题一: Snackbar 报错不显示

原本代码：

```
Widget basicListSection = Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
          onTap: (){
            _showToast(context,"Map");
          },
        ),
      ],
    )
);
```

原因：原本用的 context 是 Scaffold 的实例化的 widget 的 context, 不是 Scaffold 的。

参考：[link](https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold/51304732)

所以要改成下面这样：(用 Builder(
        builder: (context) => ) 包起来

```
Widget basicListSection = Builder(
        builder: (context) => Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                  onTap: (){
                    _showToast(context,"Map");
                  },
                ),
              ],
            )
        )
    );
```


#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










