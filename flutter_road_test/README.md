## Flutter 学习之路 - 测试（单元测试，Widget 测试，集成测试）
> 实验 Flutter 的三种测试方法--- [代码Github地址]()

### 关于 Flutter 的测试

前段时间去纽约的 Google 参加 Flutter 的聚会，听到在 Google Material Flutter 团队的 MH Johnson 在台上讲 Flutter 的测试，想到自己该学习了哈哈哈。

一般来说，经过良好测试的应用应该有很多 unit tests 和 widget test，通过代码覆盖率([code coverage](https://en.wikipedia.org/wiki/Code_coverage))进行跟踪，以及需要足够的集成测试来涵盖所有重要的使用场景。下面的表格，总结了在不同类型测试的特点，方便在选择的时候进行权衡：

|  | 单元测试 | Widget 测试 | 集成测试 |
| ------ | ------ | ------ | ------ | 
| 置信度 | Low | Higher | Highest | 
| 维护成本 | Low | Higher | Highest | 
| 依赖 | Few | More | Lots | 
| 执行速度 | Quick | Slower | Slowest | 

那么这三个重要程度是怎么样呢？这个图可以参考一下：

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/test/flutter_meetup_test.jpg)


#### 单元测试

> 参考文章（主要就是按这个学习翻译的,英文 ok 可以直接看官网）：[link](https://flutter.dev/docs/cookbook/testing/unit/introduction)

测试单一功能、方法或类。例如，被测单元的外部依赖性通常被模拟出来，如package:mockito。 单元测试通常不会读取/写入磁盘、渲染到屏幕，也不会从运行测试的进程外部接收用户操作。单元测试的目标是在各种条件下验证逻辑单元的正确性。

##### 第一步：添加 **test** 或者 **flutter_test** 依赖

在 **pubspec.yaml** 里添加如下方法（嫌麻烦可以把冒号之后写 any）

```
dev_dependencies:
  test: <latest_version>
```
加上以后记得按一下 **Packages get** 

##### 第二步：创建测试文件

目录结构如下：（测试文件写在 test 文件里面）

```
flutter_road_test/
  lib/
    counter.dart
  test/
    counter_test.dart
```

##### 第三步：创建要测试的类

创建一个要被测试的单元，这个单元可以是一个方法或一个类，下面在 **lib/counter.dart** 文件中创建 **Counter** 类：

```Dart
class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
```
##### 第四步：为这个类写 test

**test** 和 **expect** 都来自 test 这个包：

```Dart
// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:counter_app/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
```

##### 第五步：如果有多个测试，可以用 *group* 

group 里面包含了三个测试（初始状态测试，increment 方法测试，counter.decrement 方法测试）

```Dart
import 'package:test/test.dart';
import 'package:counter_app/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
```

##### 第六步：运行测试

在命令行下运行：

```
flutter test test/counter_test.dart
```

结果：

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/test/unit_test_result.png)

其他运行方式可以在这里看：[link](https://flutter.dev/docs/cookbook/testing/unit/introduction)

#### Widget 测试
> 参考文章（主要就是按这个学习翻译的,英文 ok 可以直接看官网）：[link](https://flutter.dev/docs/cookbook/testing/widget/introduction)

##### 第一步：添加 flutter_test 包

为什么要用这个包，不用前面的 **test** 包呢，因为 **flutter_test** 包有下面这些功能：

- 等等再补充


```
dev_dependencies:
  flutter_test:
    sdk: flutter
```

##### 第二步：创建一个要测试的 Widget

```Dart
class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
```

##### 第三步：写测试代码

有了要测试的 Widget 以后，可以开始写测试了:

1. 创建一个 **testWidgets** 方法
2. 用 **tester.pumpWidget** 来创建一个 **MyWidget**
3. 用 **finder** 来在 Widget tree 中找到 title 和 message 的 Text Widgets
4. 用 **expect** 和 **findsOneWidget** 来测试这个 Widget 是不是只出现了一次

```Dart
void main() {
  // with Widgets in the test environment.
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the Widget tell the tester to build it
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    // Create our Finders
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify our
    // Text Widgets appear exactly once in the Widget tree
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
```

##### 第四步：运行测试

发现在 Android Studio 里邮件代码文件点运行就能运行了：

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/test/widget_test_result.png)

##### 补充

[1] 第三步中的 WidgetTester 除了 pumpWidget 还提供了其他的方法，在使用 StatefulWidget 或者 animations 的时候可以用到：

- tester.pump()：[文档链接](https://api.flutter.dev/flutter/flutter_test/TestWidgetsFlutterBinding/pump.html)

- tester.pumpAndSettle()：[文档链接](https://api.flutter.dev/flutter/flutter_test/WidgetTester/pumpAndSettle.html)



[2] 第三步中的 **findsOneWidget** 是一个 **Matcher**，还有一些其他的 **Matcher** 可以用：

```
findsOneWidget 只有一个对应的 Widget
findsNothing 没有找到对应的 Widget
findsWidgets 找到一个或一个以上对应的 Widget
findsNWidgets 找到 N 个 Widget

最后那个查了一下 API, 是这么用的:
expect(find.text('Save'), findsNWidgets(2));
```


#### 集成测试
> 参考文章（主要就是按这个学习翻译的,英文 ok 可以直接看官网）：[link](https://flutter.dev/docs/cookbook/testing/integration/introduction)

单元测试 和 Widget 测试可以用于测试单独的 class, function, 和 Widget。当要测试各部分一起运行或者测试一个 application 在真实设备上运行的表现的时候就要用到**集成测试**。

##### 第一步：创建要测试的 App

首先，要创建一个被测试的 App, 这个应该功能就是按悬浮按钮 +1，就是初始给的那个 demo, 不一样的在于这里我们给 **Text** 和 **FloatingActionButton** 添加了 **ValueKey** 以便在测试时识别这些特点的 Widgets。

```Dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text Widget. This allows us
              // to identify this specific Widget from inside our test suite and
              // read the text.
              key: Key('counter'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this the button. This allows us to find this
        // specific button and tap it inside the test suite.
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

##### 第二步：添加 flutter_driver 依赖

在集成测试中要用到 **flutter_driver**，在 **pubspec.yaml** 中加入它。

```Dart
dev_dependencies:
  flutter_driver:
    sdk: flutter
  test: any
```
同时，也添加了 **test** ，因为也要用到这里面的方法和断言。

##### 第三步：写 test 代码

1. 创建文件夹 **test_driver**（和 lib 文件同级）
2. 在文件夹下创建两个文件(命名可以随意)，一个是创建指令化的 Flutter 应用程序，使我们能 "运行" 这个app,并记录运行的 performance  （app.dart），另一个用于写测试来判断app 是不是按预期运行（app_test.dart），目录如下：

```
flutter_road_test/
  lib/
    main.dart
  test_driver/
    app.dart
    app_test.dart
```


##### 第四步：创建指令化的 Flutter 应用程序

创建指令化的 Flutter 应用程序要有这两步：

1. 它启用了Flutter Driver的扩展
2. 运行 App

在 **test_driver/app.dart** 文件里写下这两步：

```Dart
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_road_test/main.dart' as app;

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.main();
}
```

##### 第五步：写测试

现在有了指令化的 app, 我们要写测试了，测试需要下面四步:

1. 用 **SeralizableFinders** 来定位特定的 Widgets
2. 测试前，在 **setUpAll** 方法中连接 app
3. 测试一些重要的情况
4. 当测试完，在 **teardownAll** 方法中断开连接


```Dart
// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // 通过 Finders 找到对应的 Widgets
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // 连接 Flutter driver 
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // 当测试完成断开连接
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // 用 `driver.getText` 来判断 counter 初始化是 0
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // 首先，点击按钮
      await driver.tap(buttonFinder);

      // 然后，判断是否增加了 1
      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}
```

##### 第六步：运行测试

运行一个 Android 或者 iOS 模拟器或者连上自己的手机，然后从项目根目录下运行下面的命令：

```
flutter drive --target=test_driver/app.dart
```

命令的作用：

1. 运行目标 app 并安装
2. 启动 app
3. 运行 **app_test.dart** 里的测试

结果：

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/test/integration_test_result.png)

### 代码地址

[https://github.com/draftbk/flutter_road/tree/master/flutter_road_test](https://github.com/draftbk/flutter_road/tree/master/flutter_road_test)

### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)


### 参考文档

- [https://flutterchina.club/testing](https://flutterchina.club/testing)
- [https://flutter.dev/docs/testing](https://flutter.dev/docs/testing)
- [https://flutter.dev/docs/cookbook/testing/unit/introduction](https://flutter.dev/docs/cookbook/testing/unit/introduction)
- [https://flutter.dev/docs/cookbook/testing/widget/introduction](https://flutter.dev/docs/cookbook/testing/widget/introduction)
- [https://flutter.dev/docs/cookbook/testing/integration/introduction](https://flutter.dev/docs/cookbook/testing/integration/introduction)







