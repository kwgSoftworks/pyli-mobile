import 'package:customerapp/src/helpers/logger.dart';
import 'package:customerapp/src/helpers/snack.dart';
import 'package:dio/dio.dart';

import '_api.dart';

class Api{

  Api._();

  static final _dio = Dio();

  static const int _connectTimeout = 30000;
  static const int _receiveTimeout = 30000;

  static final Map<String, dynamic> _headers = {
    'Accept' : 'application/json',
    'Content-Type' : 'application/json',
  };

  static final BaseOptions _options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout
  );

  static Dio _baseClient(bool authRequired){
    if(authRequired){
      _headers.update(
        'AUTHORIZATION', (existingValue) => 'Bearer ',
        ifAbsent: () => 'Bearer ',
      );
    }

    _dio.options = _options..headers = _headers;

    _dio.options = _options..baseUrl = ApiEndpoints.baseUrl;

    return _dio;
  }

  static AResponse _processData(String route, Response apiResponse){

    /// checking status code
    /// making sure it request was a success
    if(apiResponse.statusCode! >= 200 || apiResponse.statusCode! < 300){

      /// logging result
      Log.i('------------DATA------------\n$route', apiResponse.data);

      return AResponse(
        error: false,
        data: apiResponse.data,
      );

    }else{
      /// logging result
      Log.e(route, apiResponse.statusMessage);
      return AResponse(
        error: true,
        message: 'Api Status Code: ${apiResponse.statusCode}\nMessage: ${apiResponse.statusMessage}'
      );
    }
  }

  static String _processErrorMessage(dynamic error){

    String errorMsg = '';

    if(error is DioError){
      if(error.response!.statusCode == 503){
        errorMsg += 'Server maintenance';
        Snack.showErrorSnack(
          title: 'Maintenance',
          message: 'Our servers are currently under maintenance, try again after a few moments'
        );
        return errorMsg;
      }


      if(error.type == DioErrorType.connectTimeout){
        errorMsg += 'Request timed out';
      } else if(error.response!.statusCode! >= 400){
        try{
          errorMsg += error.response!.data['detail'];
        }catch(e){
          errorMsg += error.response!.toString();
        }
      }

      return errorMsg;
    }

    return error.toString();
  }

  static Future<AResponse> get(
      String endpoint,
      {
        Map<String, dynamic> queryParams = const {},
        String? baseUrl
      }
      )async{
    try{

      /// adding the authorization token base to requirements
      final client = _baseClient(ApiEndpoints.isAuthRequired(endpoint));

      /// logging route and data
      final route  = 'GET $endpoint';
      Log.w(route, queryParams);

      final apiResponse = await client.get(
          endpoint,
          queryParameters: queryParams
      );

      return _processData(route, apiResponse);

    }catch(e){
      final errorMsg = _processErrorMessage(e);
      Log.e(errorMsg, '**********$endpoint FAILED**********');
      return AResponse(
          error: true,
          message: errorMsg
      );
    }
  }

  static Future<AResponse> post(
      String endpoint,
      {
        Map<String, dynamic>? queryParams,
        dynamic data,
      }
      )async{
    try{

      /// adding the authorization token base to requirements
      final client = _baseClient(ApiEndpoints.isAuthRequired(endpoint));

      /// logging route and data
      final route  = 'POST $endpoint';
      Log.w(route, queryParams ?? data);

      final apiResponse = await client.post(
          route,
          queryParameters: queryParams,
          data: data
      );

      return _processData(route, apiResponse);

    }catch(e){
      final errorMsg = _processErrorMessage(e);
      Log.e(errorMsg, '**********$endpoint FAILED**********');
      return AResponse(
        error: true,
        message: errorMsg
      );
    }
  }

  static Future<AResponse> put(
      String endpoint,
      {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic> data = const {},
      }
      )async{
    try{

      /// adding the authorization token base to requirements
      final client = _baseClient(ApiEndpoints.isAuthRequired(endpoint));

      /// logging route and data
      final route  = 'PUT $endpoint';
      Log.w(route, queryParams ?? data);

      final apiResponse = await client.put(
          route,
          queryParameters: queryParams,
          data: data
      );

      return _processData(route,apiResponse);

    }catch(e){
      final errorMsg = _processErrorMessage(e);
      Log.e(errorMsg, '**********$endpoint FAILED**********');
      return AResponse(
          error: true,
          message: errorMsg
      );
    }
  }

  static Future<AResponse> delete(
      String endpoint,
      {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic> data = const {},
      }
      )async{
    try{

      /// adding the authorization token base to requirements
      final client = _baseClient(ApiEndpoints.isAuthRequired(endpoint));

      /// logging route and data
      final route  = 'DELETE $endpoint';
      Log.w(route, queryParams ?? data);

      final apiResponse = await client.delete(
          route,
          queryParameters: queryParams,
          data: data
      );

      return _processData(route, apiResponse);

    }catch(e){
      final errorMsg = _processErrorMessage(e);
      Log.e(errorMsg, '**********$endpoint FAILED**********');
      return AResponse(
          error: true,
          message: errorMsg
      );
    }
  }
}