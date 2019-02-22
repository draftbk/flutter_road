## Flutter 学习之路 - 异步任务
> 实验 Flutter 的异步任务 --- [代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day10.dart)

### Fultter 异步任务试验

Flutter 在很多地方需要用到异步的任务，例如，加载网络数据，任务延迟执行等，所以异步任务是不可避免的问题。本次试验主要试验了下面几种情况：

- 用 Future, then 实现任务延迟执行
- 用 async 和 await 实现任务延迟执行
- 测试调用 async 方法时，代码的执行顺序问题

[代码地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day10.dart)

![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_async.gif)


#### 用 Future, then 实现任务延迟执行

Future 可以用来执行未来要执行的方法，例如下面代码，先输出 ”Started“, 调用 Future 以后过了一秒钟，再输出 ”Completed Task1“。

```
void thenCatch(){
  mytext="Started";
  setMyTextState(mytext);
  // then 用来说明 1 second 后做什么
  Future.delayed(Duration(seconds: 1)).then((_){
    // 当运行完成
    mytext = mytext + "\n" + "Completed Task1";
    setMyTextState(mytext);
  }).catchError((e){
    // 当运行失败
    mytext=mytext+"\n"+'failed: ${e.toString()}';
    setMyTextState(mytext);
  });
}
```

#### 用 async 和 await 实现任务延迟执行

await 也是 Flutter 中很好的一种执行异步任务的方法。

但是要使用await，必须在有async标记的函数中运行，否则这个await会报错。

下面这个方法会怎么输出呢：

```
Future<void> asyncAwait() async{
  mytext="Started";
  setMyTextState(mytext);
  try{
    // 这里没有 .then, 要加 await, await 是说在 await 完成前别往下执行
    await Future.delayed(Duration(seconds: 1));
    mytext=mytext+"\n"+"Completed Task1";
    setMyTextState(mytext);
    await Future.delayed(Duration(seconds: 1));
    mytext=mytext+"\n"+"Completed Task2";
    setMyTextState(mytext);
  }catch(e){
    print('failed: ${e.toString()}');
  }
}
```

答案是：

```
Started
--- 1 second ---
Completed Task1
--- 2 second ---
Completed Task2
```
先输出 ”Start“, 然后过一秒，输出 ”Completed Task1“ 再过一秒输出 ”Completed Task2“ 。

如果把方法里的 await 去掉会发生什么呢，答案是，时间不会停止，下面两个任务 Task1, Task2 会马上执行，不会等 Future.delayed 完成。

```
Started
Completed Task1
Completed Task2
--- 1 second ---
```

#### 测试调用 async 方法时，代码的执行顺序问题

现在，下面这段代码如果执行 asyncAwaitWithTask()方法，会怎么样输出呢？

```
Future<void> asyncAwaitWithTask() async{
  mytext="Started";
  setMyTextState(mytext);
  try{
    // 这里没有 .then, 要加 await, await 是说在 await 完成前别往下执行
    await Future.delayed(Duration(seconds: 1));
    mytext=mytext+"\n"+"Completed Task1";
    setMyTextState(mytext);
    task2();
    mytext=mytext+"\n"+"Completed Task3";
    setMyTextState(mytext);
    mytext=mytext+"\n"+"Completed Task4";
    setMyTextState(mytext);
  }catch(e){
    print('failed: ${e.toString()}');
  }
}

void task2() async{
  await Future.delayed(Duration(seconds: 1));
  mytext=mytext+"\n"+"Completed Task2";
  setMyTextState(mytext);
}
```
答案是, Task3, Task4 会先于 Task2 执行，我放在前面的 GIF 图就是运行的这个场景。

```
Started
--- 1 second ---
Completed Task1
Completed Task3
Completed Task4
--- 2 second ---
Completed Task2
```


### Flutter 学习之路 Github 地址

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)










