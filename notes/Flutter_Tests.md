## Flutter 学习之路 - 测试（Tests）
> 实验 Flutter 的三种测试方法--- [代码Github地址]()

### 关于 Flutter 的测试

前几天去纽约的 Google 参加 Flutter 的聚会，听到在 Google Material Flutter 团队的 MH Johnson 在台上讲 Flutter 的测试，想到自己该学习了哈哈哈。

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

> 参考文章（主要就是按这个学的,英文 ok 可以直接看官网）：[link](https://flutter.dev/docs/cookbook/testing/unit/introduction)

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

##### 第五步：如果有多个测试，可以用 *group* 

##### 第六步：运行测试

在命令行下运行：

```
flutter test test/counter_test.dart
```

结果：

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/picture/test/unit_test_result.png)

其他运行方式可以在这里看：[link](https://flutter.dev/docs/cookbook/testing/unit/introduction)

#### Widget 测试
> 参考文章（主要就是按这个学的,英文 ok 可以直接看官网）：[link](https://flutter.dev/docs/cookbook/testing/widget/introduction)

##### 第一步：添加 flutter_test 包

为什么要用这个包，不用前面的 **test** 包呢，因为 **flutter_test** 包有下面这些功能：

- 等等再补充


```
dev_dependencies:
  flutter_test:
    sdk: flutter
```

##### 第二步：创建一个要测试的 Widget



#### 集成测试



### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)


### 参考文档

- [https://flutterchina.club/testing](https://flutterchina.club/testing)

- [https://flutter.dev/docs/testing](https://flutter.dev/docs/testing)







