## Flutter Image 控件
> 实验一些常用的 Image 功能 （[代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day3.dart)）

### Image 试验

Flutter 学习之路第三次试验，试验了有关于 Image 常用的一些功能，包括图片本地加载，图片和 GIF 的网络加载，图片渐现呈现，从网络加载图片并缓存在内存中。

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_image.gif)

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day3.dart)

##### 加载本地图片

在 lib 同级目录下创建文件夹 images, 并且在 pubspec.yaml 文件中添加如下几行。

```
flutter:
  assets:
    - images/flutter.png
```

用 AssetImage 获取图片

```
// Image from asserts
 Padding(
   padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
   child: new Image(
       image:new AssetImage('images/flutter.png'),
       width: 50,
       height: 50,
   ),
 ),
```

##### 根据网络链接加载图片 

```
// Image from internet
Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
  child: Image.network(
    'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
     scale: 4,
  ),
),
```

##### 从网络链接加载 **GIF** 

可以很方便地加载 GIF 是个很棒的功能了，找了个 Google 动图哈哈

```
 // Gif from internet
 Padding(
   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
   child:Image.network(
     'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/day3/google.gif?raw=true',
     scale: 4,
   ),
 ),
```

##### FadeInImage（图片渐现呈现）

在 pubspec.yaml 加入 cached\_network\_image

```
 // FadeInImage
 Padding(
   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
   child: FadeInImage.memoryNetwork(
       width: 180,
       height: 180,
       placeholder: kTransparentImage,
       image: 'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
   ),
 ),
```

##### CachedNetworkImage （从网络加载图片并缓存在内存中）

在 pubspec.yaml 加入 cached\_network\_image

```
// CachedNetworkImage
Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
  child: CachedNetworkImage(
    width: 100,
    height: 100,
    placeholder: CircularProgressIndicator(),
    imageUrl:
    'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/day3/flutter.png?raw=true',
  ),
),
```


#### 遇到的问题

所以还是记录一些自己遇到的问题。

##### 问题一: 当我使用如下代码加载 Gif 以及 png 时，不能显示


```
// Gif from internet
adding(
  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
  child:Image.network(
    'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/day3/google.gif?raw=true',
    scale: 2,
  ),
)
```

解决方法：在链接后面加上 **?raw=true** 就可以显示了

```
'https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/day3/google.gif?raw=true',
```
##### 问题二: 不知道 assets 文件夹在哪创建，图片放哪可以被用到


查了一下发现，其实不用非要 assets 文件夹，Flutter 使用 pubspec.yaml 文件（位于项目根目录），来识别应用程序所需的asset。 可以创建一个其他名字的文件夹来标识 assets 路径。

```
flutter:
  assets:
    - images/flutter.png
```

##### 问题三：在导入 package 的时候有时候不知道导入什么版本

懒人方法：any

```
dependencies:
  flutter:
    sdk: flutter
  transparent_image: any
  cached_network_image: any
```

##### 问题四：最开始没有给 Container 设置宽度，在加载图片时动画布局变化很糟（果然还是新手233）

解决：给 Container 设置 width

```
Widget buttonSection = Container(
  padding: const EdgeInsets.all(15.0),
  width: 1000,
```

#### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










