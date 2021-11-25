import 'package:dio/dio.dart';

class NetworkUtils{
  static Dio attachDefaultInterceptors(Dio dio){
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000; //5s
    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      ///Do something before the request is sent
      options.headers['Content-Type'] = 'application/json';
      ///Add Token to the calls
      // var accessToken = (await getAccessTokenFromCache()).accessToken;
      // if (accessToken != null && accessToken.isNotEmpty) {
      //   options.headers['Authorization'] = 'Bearer $accessToken';
      // }
      return handler.next(options);
    }, onResponse: (response, handler) {
      /// Do something with response data
      return handler.next(response);
    }, onError: (DioError err, handler) async {
      ///Do something with response error
      if (err.response?.statusCode == 401) {
         await refreshUserToken(dio: dio);
      }
      return handler.next(err);
    }));

    return dio;
  }

  static Future<void> refreshUserToken({required Dio dio}) async {

    // Response response = await dio.post(UrlConstants.login, data: refreshBody);
    //
    // if (response != null && response.statusCode == 200) {
    //   final Map<String, dynamic> responseData = json.decode(response.toString());
    //
    //   AccessTokenResponse authUser = AccessTokenResponse.fromJson(responseData);

      //dio.request(dioError.requestOptions.path, data: dioError.requestOptions.data);
    }
  }
