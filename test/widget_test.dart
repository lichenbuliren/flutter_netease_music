// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//单元测试文档 https://github.com/dart-lang/test/blob/master/pkgs/test/README.md#writing-tests

import 'package:flutter_netease_music/common/http.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('测试 Dio 单例类 Http 封装，多次实例化，得到的对象应该是同一个', () {
    Http http1 = Http();
    Http http2 = Http();

    expect(http1 == http2, true);
  });

  test('测试网络请求单例模式', () async {
    Map<String, dynamic> data = await Http()
        .get('/login/cellphone?phone=13602532846&password=wrf123456');
    var account = data['account'];
    expect(account != null, true);
  });
}
