## Flutter 学习之路 - 测试（Tests）
> 实验 Flutter 的三种测试方法--- [代码Github地址]()

### 关于 Flutter 的测试

前几天去纽约的 Google 参加 Flutter 的聚会，听到大神在台上讲 Flutter 的测试，想到自己该学习了哈哈哈。


一般来说，经过良好测试的应用应该有很多 unit tests 和 widget test，通过代码覆盖率([code coverage](https://en.wikipedia.org/wiki/Code_coverage))进行跟踪，以及需要足够的集成测试来涵盖所有重要的使用场景。下面的表格，总结了在不同类型测试的特点，方便在选择的时候进行权衡：

|  | 单元测试 | Widget 测试 | 集成测试 |
| ------ | ------ | ------ | ------ | 
| 置信度 | Low | Higher | Highest | 
| 维护成本 | Low | Higher | Highest | 
| 依赖 | Few | More | Lots | 
| 执行速度 | Quick | Slower | Slowest | 

[https://www.cnblogs.com/gzdaijie/p/5222191.html](https://www.cnblogs.com/gzdaijie/p/5222191.html)


![](https://github.com/draftbk/Blog_Resource/blob/master/Flutter/gif/flutter_road_navigationbar.gif)




#### 单元测试
测试单一功能、方法或类。例如，被测单元的外部依赖性通常被模拟出来，如package:mockito。 单元测试通常不会读取/写入磁盘、渲染到屏幕，也不会从运行测试的进程外部接收用户操作。单元测试的目标是在各种条件下验证逻辑单元的正确性。


```Dart

```


#### Widget 测试

#### 集成测试



### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)


### 参考文档

- [https://flutterchina.club/testing](https://flutterchina.club/testing)

- [https://flutter.dev/docs/testing](https://flutter.dev/docs/testing)







