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