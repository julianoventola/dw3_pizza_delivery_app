import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RestClient extends GetConnect {
  String baseUrl = 'http://192.168.15.45:8080';

  RestClient() {
    httpClient.baseUrl = baseUrl;
  }
}

class RestClientException implements Exception {
  final int code;
  final String message;

  RestClientException({
    this.code,
    @required this.message,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
