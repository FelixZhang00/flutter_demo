import 'package:dio/dio.dart';


class HttpRequest {
  static BaseOptions baseOption = BaseOptions(connectTimeout: 10000);
  static Dio dio = Dio();

  static Future<T> request<T>(String url,
      {String medthod = "get", Map<String, dynamic> params}) async {

      Options options = Options();
      options.method = medthod;


       try{
         Response response = await dio.request<T>(url,queryParameters: params, options: options);
         return response.data;
       } on DioError catch(e){
         throw e;
       }

  }
}
