## Flutter Image 控件
> 实验一些常用的 Image 功能 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day3.dart)

### Image 实验

实验了 Image 常用的一些功能

1. 根据网络链接加载图片 
2. 从网络链接加载 **GIF** (这个很棒有没有)
3. 本地加载图片
4. FadeInImage（记得在 pubspec.yaml 加入 cached_network_image）
5. CachedNetworkImage（记得在 pubspec.yaml 加入 cached_network_image）


![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/flutter_load_image.gif)

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day3.dart)

#### 遇到的问题

感觉对于控件，各个参数主要是看官网文档，然后自己改改, 所以还是记录一下遇到的问题。

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










