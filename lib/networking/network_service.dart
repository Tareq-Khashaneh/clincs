import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import '../core/constants/api_endpoint.dart';
import '../core/constants/error.dart';
import '../core/constants/typedef.dart';

abstract class NetworkService {
  Future<dio.Response?> get(
      {required String url, required String authToken, parameters? params});
  Future<dioRes?> post({required String url, required parameters data});
}

class NetworkServiceDio implements NetworkService {
  final dio.Dio _dio = dio.Dio();
  NetworkServiceDio() {
    dio.BaseOptions options = dio.BaseOptions(
      baseUrl: Api.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 8), // 60 seconds
      receiveTimeout: const Duration(seconds: 8),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    _dio.options = options;
  }
  @override
  Future<dioRes?> get(
      {required String url,
      required String authToken,
      parameters? params}) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $authToken';
      dioRes response = await _dio.get(
        url,
        queryParameters: params,
      );
      return response;
    } on dio.DioException catch (e) {
      print("error in get service $e");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }

  @override
  Future<dioRes?> post({required String url, required parameters data}) async {
    try {
      dioRes? response = await _dio.post(url, data: data);
      return response;
    } on dio.DioException catch (e) {
      print("error in post service ${e.toString()}");
      DioExceptions.getExceptionType(e);
      return null;
    }
  }
}
