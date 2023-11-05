import 'package:dio/dio.dart';

class WebService{
  final Dio _dio = Dio();

  Future<Response> getMethod(url) async {
    final response = await _dio.get(url,
        options: Options(method: 'Get', responseType: ResponseType.json));
    return response;
  }
}