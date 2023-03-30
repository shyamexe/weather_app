import 'package:dio/dio.dart';
import 'package:weather_app/src/shared/http/api_url.dart';

enum RequestType { POST, GET, DELETE, PATCH }

class APiProvider {
  final _dio = Dio();

  Future post(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
  }) async {
    return await _handleRequest(
      path,
      RequestType.POST,
      body: body,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
    );
  }

  Future get(
    String path, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    return await _handleRequest(
      path,
      RequestType.GET,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
    );
  }

  Future patch(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
  }) async {
    return await _handleRequest(
      path,
      RequestType.PATCH,
      body: body,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
    );
  }

  Future delete(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
  }) async {
    return await _handleRequest(
      path,
      RequestType.DELETE,
      body: body,
      newBaseUrl: newBaseUrl,
      token: token,
      query: query,
    );
  }

  Future _handleRequest(
    String path,
    RequestType requestType, {
    dynamic body,
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
      'Access-Control-Allow-Origin': '*'
    };

    try {
      var response;
      if (requestType == RequestType.POST) {
        response = await _dio.post(
          url,
          data: body,
          queryParameters: query,
          options: Options(validateStatus: (status) => true, headers: headers),
        );
      } else if (requestType == RequestType.PATCH) {
        response = await _dio.patch(
          url,
          data: body,
          queryParameters: query,
          options: Options(validateStatus: (status) => true, headers: headers),
        );
      } else if (requestType == RequestType.DELETE) {
        response = await _dio.delete(
          url,
          data: body,
          queryParameters: query,
          options: Options(validateStatus: (status) => true, headers: headers),
        );
      } else {
        response = await _dio.get(
          url,
          queryParameters: query,
          options: Options(validateStatus: (status) => true, headers: headers),
        );
      }
      return response;

    } on DioError catch (e) {
     
        return e.error;
      
    }
  }
}
