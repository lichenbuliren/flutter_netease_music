// 单例模式 Dio 类封装
import 'dart:convert';

import 'package:dio/dio.dart';

class Http {
  // 工厂模式
  static final Http _instance = Http._internal();
  factory Http() => _instance;
  static Dio _client;

  Http._internal() {
    // 初始化
    if (_client != null) return;
    _client = new Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        connectTimeout: 500,
        receiveTimeout: 2000,
        method: 'GET',
        contentType: 'application/json; charset=utf-8',
      ),
    );
  }

  Future<Map<String, dynamic>> get(path, [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (params != null) {
      response = await _client.get(path);
    } else {
      response = await _client.get(path, queryParameters: params);
    }
    print(json.encode(response.data));
    return response.data;
  }
}
