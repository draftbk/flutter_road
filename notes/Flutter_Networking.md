## Flutter 学习之路 - 网络入门
> 实验一些 Flutter 的网络方面的功能 （[代码Github地址](https://github.com/draftbk/flutter_road/blob/master/flutter_road_widgets/lib/days/Day10.dart)）

### 概述

一开始在想标题要叫什么呢，想想网络是个很复杂的东西，这里就实验了最基本的，开发比较常用的 Get Post, 就叫网络入门吧哈哈。

Flutter 现在常用的网络方式有如下三种：

- HttpClient
- http
- dio

这里试验了三种方法的 GET,POST 方法，以及 JSON 的解析。

#### HttpClient 
HttpClient 是 Dart 原生的网络请求，flutter 中文网上的 cookbook 是用这个来实现的

不需要在 pubspec.yaml 添加依赖

##### GET 请求

```Dart
  void HttpClient_Get() async {
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(getUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        result = await response.transform(utf8.decoder).join();
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }
```

##### POST 请求

网上找没有，然后对应着官网 API 尝试用了下面这个方法还是失败，不知道为什么，存疑，希望有人能有解答：

```
  Uri uri=new Uri(path:postUrl,queryParameters: {"ip": searchIp} );
  var request = await httpClient.postUrl(uri);
  var response = await request.close();
```

#### http
flutter 官网上的 cookbook 是用这个来实现的

不需要在 pubspec.yaml 添加依赖

##### GET 请求

```
  void http_Get() async {
    String result;
    try {
      var response = await http.get(getUrl);
      if (response.statusCode == HttpStatus.OK) {
        result = response.body;
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }
```

##### POST 请求

```
  void http_Post() async {
    String result;
    try {

      var client = http.Client();
      var response = await client.post(postUrl, body: {"ip": searchIp});

      if (response.statusCode == HttpStatus.OK) {
        result = response.body;
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }
```

#### dio

dio是Flutter中文网开源的一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等

需要在 pubspec.yaml 添加依赖 **dio: any**

```
dependencies:
  flutter:
    sdk: flutter
  dio: any
```


##### GET 请求

```
  void dio_Get() async {
    String result;
    try {
      Dio dio = new Dio();
      var response = await dio.get(getUrl);
      if (response.statusCode == HttpStatus.OK) {
        result = response.data.toString();
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }
```

##### POST 请求

```
  void dio_Post() async {
    String result="";
    try {
      var dio = new Dio();
      var response = await dio.post(postUrl, queryParameters:{"ip": searchIp});
      if (response.statusCode == HttpStatus.OK) {
        result = response.data.toString();
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
  }
```

##### 其他

dio 还有好多方法，可以看看这个链接：
[https://pub.dartlang.org/packages/dio](https://pub.dartlang.org/packages/dio)

#### JSON 解析

就直接用下面的方法就可以解析了，真的很方便

```
var data = json.decode(result);
result = data['city_id'];
```


#### Flutter 学习之路 Github 地址

这是项目的 GitHub 地址，正在持续更新，欢迎 Star 呀！╮(￣▽￣)╭

[https://github.com/draftbk/flutter_road](https://github.com/draftbk/flutter_road)














