## Flutter 学习之路 - Gridview
> 实验一些常用的 Gridview 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day5.dart)

### Gridview 实验

Flutter 学习之路第五次实验，实验了 Gridview 常用的一些功能，用 Gridview 实现单词软件的一个基础功能。

- 设置 gridview 各个属性设置（间距，每行个数，长宽比）
- 自定义 item, 以及 gridview item 点击事件
- 动态添加 gridview 的 item

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day5.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/flutter_road_gridview.gif)


#### 设置 gridview 各个属性设置（间距，每行个数，长宽比）

- 用 crossAxisCount 来设置每行个数
- 用 crossAxisSpacing 设置水平间隙
- 用 mainAxisSpacing 设置上下间隙
- 用 childAspectRatio 来设置宽高比例

```
child: GridView.count(
  // 每行有几个子控件
  crossAxisCount: 2,
  // 水平子Widget之间间距
  crossAxisSpacing: 10.0,
  // 设置上下间隙
  mainAxisSpacing: 8.0,
  // 子Widget宽高比例
  childAspectRatio: 2.0,
  children: List.generate(listNumber, (index) {
    return gridItem(context, index);
  }),
),
```

#### 自定义 item, 以及 gridview item 点击事件

这两个一起写是因为，实际上，item 点击是建立在自定义 item 上的，能自定义 item 了就能点击了。

自定义一个 gridItem 的 Widget

```
Widget gridItem (BuildContext context, int _index) {
  int index=_index%words.length;
  return  Container(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () {
        setState(() {
          String temp=words[index];
          words[index]=translations[index];
          translations[index]=temp;
        });
      },
      child: Text(
        words[index],
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
    ), 
      color:myColor,
  );
}
```

用 List.generate 加载自定义的 gridItem

```
 Widget gridViewSection = Builder(
     builder: (context) => Container(
         margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
         height: 600.0,
         child: GridView.count(
           // 每行有几个子控件
           crossAxisCount: 2,
           // 水平子Widget之间间距
           crossAxisSpacing: 10.0,
           // 水平子Widget之间间距
           mainAxisSpacing: 8.0,
           // 子Widget宽高比例
           childAspectRatio: 2.0,
           children: List.generate(listNumber, (index) {
             return gridItem(context, index);
           }),
         ),
     )
 );
```

#### 动态添加 gridview 的 item

这个和之前写 listview 的动态添加套路差不多，就是改变下面这个 listNumber 的值，就可以完成动态添加.

```
 children: List.generate(listNumber, (index) {
   return gridItem(context, index);
 }),
```
同样，别忘了用 setState

```
onTap: () {
  setState(() {
    String temp=words[index];
    words[index]=translations[index];
    translations[index]=temp;
  });
},
```

### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










