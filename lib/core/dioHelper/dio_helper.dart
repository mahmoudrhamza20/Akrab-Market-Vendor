import 'package:dio/dio.dart';
import '../utils/end_points.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options.baseUrl = EndPoints.baseurl;

  static Future<Response<dynamic>> post(String path,
      {FormData? formData,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters}) {
    dioSingleton.options.headers = headers;
    return dioSingleton.post(path,
        data: formData ?? FormData.fromMap(body!),
        queryParameters: parameters,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
  }

  static Future<Response<dynamic>> postWithoutBody(String path,
      {FormData? formData,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters}) {
    dioSingleton.options.headers = headers;
    return dioSingleton.post(path,
        queryParameters: parameters,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
  }

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? parameters}) {
    dioSingleton.options.headers = headers;
    return dioSingleton.get(path, queryParameters: parameters);
  }
}
