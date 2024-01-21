import 'package:dio/dio.dart';

// base url: https://newsapi.org/
//method (url): v2/top-headlines?
// queries: country=eg&category=business&apiKey=708d777b7af549bfbcbe9c715aeeade6
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=708d777b7af549bfbcbe9c715aeeade6
// https://newsapi.org/v2/everything?q=tesla&from=2023-12-19&sortBy=publishedAt&apiKey=708d777b7af549bfbcbe9c715aeeade6
abstract class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get ({
    required String url,
    required Map<String,dynamic> query,
  }) async{
    return await dio!.get(
      //put the get method without ? sign
      url,
      queryParameters: query,
    );
  }
}
