
import 'package:dio/dio.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:school/network/reques_iInterceptor.dart';



import 'endpoints.dart';
import 'exceptions_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..interceptors.add(ExceptionInterceptor())
      ..interceptors.add(RequestInterceptor())
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ))
      ..interceptors.add(RequestsInspectorInterceptor());
  }

  // Get:------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      InspectorController().addNewRequest(
        RequestDetails(
          requestName: 'get',
          //Optional
          requestMethod: RequestMethod.GET,
          url: url,
          queryParameters: queryParameters,
          statusCode: response.statusCode ?? 0,
          responseBody: response.data,
          headers: {'language': 'en'},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------
  Future<Response> post(
    String uri, {
    data,
    bool isJson = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    void Function(int, int)? showLoading,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: isJson ? data : FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      InspectorController().addNewRequest(
        RequestDetails(
          requestName: 'POST',
          //Optional
          requestMethod: RequestMethod.POST,
          url: uri,
          queryParameters: queryParameters,
          statusCode: response.statusCode ?? 0,
          responseBody: response.data,
          headers: {'language': 'en'},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
