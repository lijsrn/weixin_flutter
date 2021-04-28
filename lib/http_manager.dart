
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:weichatdemo/common_response.dart';

class HttpManger{
  static Dio dio = Dio();

  static Future<T> request<T>(String url,
      {String method = 'get',
        Map<String, dynamic> queryParameters,
        int timeOut}) async{
    //1.创建配置,什么方式请求
    final options = Options(method: method, receiveTimeout: timeOut);

      Response response;
      String _status;
      String _msg;
      int _code;
      T _data;


        //2.发网络请求
        response = await dio.request(url, queryParameters: queryParameters,options: options,);
        if(response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created){

          try {
            if(response.data is Map){
              _code = (response.data["code"] is int) ? response.data["code"].toString() : response.data["code"];
            }
          CommonResponse(_status,_code,_msg,_data);
        } on DioError catch(e){

      }

  }

  }

}