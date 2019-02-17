## Dart入门笔记
> 参考文献: https://www.dartlang.org/samples

感觉最近要入坑 **Flutter** 了, 于是决定先了解一下它用的语言: **Dart** 的使用方法，然后写一篇笔记总结一下常用方法。

#### 运行代码的环境

大多数代码都可以在这个 DartPad 上运行:
[https://dartpad.dartlang.org/](https://dartpad.dartlang.org/)
#### 首先就是一个 Hello Word

```
void main() {
  print('Hello, World!');
}
```
#### Dart 变量类型

Dart 可以像 JS 一样用 var  来申明不指定它类型的变量，也可以申明特定类型的变量。

用 var 来申明变量：

```
// 字符串
var name = 'Voyager I';
// 整型
var year = 1977;
// 浮点型
var antennaDiameter = 3.7;
// 列表 List
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
// Map 类型
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

申明特定类型的变量：

```
// 字符串
String name = 'Voyager I';
// 整型
int year = 1977;
// 浮点型
double antennaDiameter = 3.7;
// 列表 List
List flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
// Map 类型
Map image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```
然后，赋值变量的时候要记得考虑关键字：[关键字表](http://wiki.jikexueyuan.com/project/dart-language-tour/keywords.html)


#### 条件语句

```
//if 语句
if (判断条件) {
  执行语句;
} else if (判断条件) {
  执行语句;
} else{
  执行语句;
}
```

```
// switch case
var number = '1';
switch (number) {
  case '1':
    print('The number is 1');
    break;
  case '2':
    print('The number is 2');
    break;
  case '3':
    print('The number is 3');
    break;
  default:
    print('The number is Unknown');
}
```

#### 循环语句
两种 For 循环

```
// 第一种，就像 java 的 for 循环
for (var i = 0; i < 2; i++) {
  print(i);
}
// 第二种，遍历 List 和 Set, 和 Python 用法很像
var myList = [0, 1, 2];
for (var x in myList) {
  print(x); // 0 1 2
}
```
While 循环

```
var i=1;
while (i < 200) {
  print(i);
  i += 1;
}
```
和其他语言一样，dart 也可以使用 break 和 continue

#### Dart 函数
```
//计算一个斐波那契数列 
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);
```
上面这个函数看着和一般的语言没差别，但是在 Dart 中和还有一个神奇的写法:

```
void main() => RunWhile(20);

RunWhile(n) {
var i=1;
while (i < n) {
  print(i);
  i += 1;
}
}
```
这么 main() 函数后面直接跟了一个 => 来调用 RunWhile 方法，这是Dart中单行函数或方法的简写。

#### 引用库


```
// 导入内置库
import 'dart:math';

// 导入外部库
import 'package:test/test.dart';

// 通过文件系统路径导入库
import 'path/to/my_other_file.dart';
```

#### 创建类

```
// 创建一个猫的类
class Cat {
  String name;
  num age;
  Cat(name, age) {
    //初始化
    this.name=name;
    this.age=age;
  }
  void talk() {
  print('My name is $name, I am ${age} years old now.');
  }
}

void main(){
// 实例化并调用方法
  var myCat=new Cat("小爪", 1); // 没错，我的🐱叫小爪！！
  myCat.talk();
}
```

结尾了结尾了！umm, 推荐一个网站，我是看这个网站总结的:
[https://www.dartlang.org/guides/language](https://www.dartlang.org/guides/language)

最后！希望 Dart 和 Flutter 能发展的好起来！

umm, 就这样，拜拜👋



