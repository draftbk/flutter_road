## Flutter 学习之路 - 导航栏（NavigationBar）
> 实验一些常用的 NavigationBar 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day7.dart)

### NavigationBar 实验


- 底部导航栏 [代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day7.dart)
- 顶部导航栏 [代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/subpage/TopBarPage.dart)




![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_navigationbar.gif)


#### 底部导航栏（Part1）

底部导航用 PageView 和 BottomNavigationBar 完成。大段的代码就不贴了，在 [Github 代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day7.dart) 就能找到。

##### BottomNavigationBar

BottomNavigationBar 在 items 里面添加想要的 BottomNavigationBarItem，然后 currentIndex 代表当前 item, page 在 PageView 的 onPageChanged()更改。

```
 bottomNavigationBar: new BottomNavigationBar(items: [
   new BottomNavigationBarItem(
       icon: new Icon(FontAwesomeIcons.font),
       title: new Text("Text"),
       backgroundColor: Colors.grey
   ),
   //更多 BottomNavigationBarItem
 ],
     onTap: onTap,
     currentIndex: page
 ),
```

##### 改变页面切换时候的动画效果
看 onTap 方法，其中改变 curve 可以改变页面切换时候的动画效果，可以点进 curves,dart 里面看看，有挺多种方法，尝试了一下，还是 Curves.ease 是一种最让人舒服的动画。 然后 duration 可以设置动画时间，可以尝试设置成 1000，你会发现切换页面，嗯，很慢。

```
 void onTap(int index) {
  pageController.animateToPage(
      index,
      // 设置页面转换效果的时间
      duration: const Duration(milliseconds: 300),
      // 设置转换时的效果
      curve: Curves.ease);
}
```

##### PageView

然后是 PageView：用把子页面放到 children 里面(这里Page1() 什么的是为了简化篇幅，实际上没这个 class)，然后用一个 pageController 来监听页面切换，可以上面的代码里就有 pageController 来控制页面和转换效果。用 onPageChanged 监听页面切换，执行页面切换以后的要执行的操作。

```
 body: new PageView(
     children: [
       new Page1(),
       new Page2(),
       new Page3(),
     ],
     controller: pageController,
     onPageChanged: onPageChanged,
 ),
```
用 onPageChanged 监听页面切换，切换后设置当前 page 值。

```
  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
```
##### 设置起始子页面：

```
  @override
  void initState() {
    super.initState();
    // 设置初始化page
    pageController = new PageController(initialPage: this.page);
  }
```

#### 顶部导航栏（Part2）

用 AppBar 实现，用 title 设置顶部 bar 的文字，bottom用 TabBar 设置导航栏的图标，然后界面上在 TabBarView 里面完成不同的 subpage。

```
new AppBar(
   title: Text('TopBarPage'),
   bottom: new TabBar(
     tabs: <Widget>[
       new Tab(
         icon: new Icon(FontAwesomeIcons.google),
       ),
       new Tab(
         icon: new Icon(FontAwesomeIcons.facebook),
       ),
     ],
     controller: _tabController,
   ),
 ),
 body: new TabBarView(
   controller: _tabController,
   children: <Widget>[
     new Center(child: new Text('Google',style: TextStyle(fontSize: 20,),)),
     new Center(child: new Text('Facebook',style: TextStyle(fontSize: 20,),)),
   ],
 ),
```

#### 其他

刚刚在油管上浏览，看到 Flutter 又出新视频，上面有用 Cupertino Package 实现 iOS 风格的导航栏，有兴趣也可以看一下。

[https://www.youtube.com/watch?v=3PdUaidHc-E](https://www.youtube.com/watch?v=3PdUaidHc-E)

### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










