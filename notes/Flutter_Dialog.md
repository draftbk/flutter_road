## Flutter 学习之路 - 对话框（Dialog）
> 实验一些常用的对话框实现方式--- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day6.dart)

### Dialog 实验

补上这个应该在第六篇博客就想写的坑，试验在 Flutter 中对 dialog 的各种使用方式。

Flutter 官方建议使用 SimpleDialog 和 AlertDialog 两种方式来实现 Dialog, 然后这篇文章受下面这篇安卓的博客的启发，尝试实现一些不同功能的 Dialog:

[https://www.cnblogs.com/gzdaijie/p/5222191.html](https://www.cnblogs.com/gzdaijie/p/5222191.html)


![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_navigationbar.gif)


#### 底部提示栏

最简单的提示方式，从底部弹出提示。

```Dart
Future<void> _showSnackBar(BuildContext context, String text) async {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
```


#### 简单的 Dialog

见到提示对话框，只是提示功能，不需要交互。当看到显示之后，就只需要点击 “是的”，表示知道就行了。

```Dart
Future<void> _showSnackBar(BuildContext context, String text) async {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
```

#### 一个列表的 Dialog

列表的 Dialog 可以选择点击不同的 item 进行不同的操作。

在实现的时候遇到了一个坑，就是，在SingleChildScrollView里不能用 ListView，是直接在 ListBody 里面加入 ListTile 就好了。

```Dart
Future<void> _showListAlertDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('我是一个列表 Dialog'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
                onTap: () {
                  setMyTextState("你选择了: Map");
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Album'),
                onTap: () {
                  setMyTextState("你选择了: Album");
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                onTap: () {
                  setMyTextState("你选择了: Phone");
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
```



#### 单选框 Dialog （啊啊啊我还是先写一篇 setState， stateful widget 之类的文章再写这个好了！现在写就是在乱试，乱写！）

一开始以为会和上面那个 Dialog 差不多实现，实际上还是遇到了问题，发现在按下按钮不会产生选中效果，因为这个 

### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










