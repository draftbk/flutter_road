## Flutter Listview
> 实验一些常用的 List 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day4.dart)

### Listview 实验

实验了 Listview 常用的一些功能

1. 实现最基本的 Listview
2. 实现水平的 Listview
3. 给Listview item 加上点击事件
4. Listview 动态更新


![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/flutter_load_listview.gif)

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day4.dart)

#### 遇到的问题

感觉对于控件，各个参数主要是看官网文档，然后自己改改, 所以还是记录一下遇到的问题。

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

##### 问题二: 如何动态更新
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

#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










