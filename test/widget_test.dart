// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_netease_music/common/http.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('测试网络请求单例模式', () async {
    Map<String, dynamic> data = await Http()
        .get('/login/cellphone?phone=13602532846&password=wrf123456');
    print(data);
  });
}
