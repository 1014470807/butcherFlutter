import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/local/local_storage.dart';
import 'package:butcher/common/net/code.dart';
import 'package:butcher/common/net/result_data.dart';
import 'dart:collection';

import 'package:butcher/common/net/interceptors/error_interceptor.dart';
import 'package:butcher/common/net/interceptors/header_interceptor.dart';
import 'package:butcher/common/net/interceptors/log_interceptor.dart';

import 'package:butcher/common/net/interceptors/response_interceptor.dart';
import 'package:butcher/common/net/interceptors/token_interceptor.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = new Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager() {
    _dio.interceptors.add(new HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    //_dio.interceptors.add(new LogsInterceptors());
    //_dio.interceptors.add(new ErrorInterceptors(_dio));
    //_dio.interceptors.add(new ResponseInterceptors());

    _dio.options.contentType = CONTENT_TYPE_FORM;
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(
      url, Map<String, dynamic> params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    ///添加自定义头部
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    ///添加自定义参数
    Map<String, dynamic> newParams = new HashMap();
    newParams["appId"] = 1001;
    if (params != null) {
      newParams.addAll(params);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
//      return new ResultData(
//          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
//          false,
//          errorResponse.statusCode);
    return errorResponse;
    }

    Response response;
    try {
      print(newParams);
      print(option.method);
      print(option == Options(method: "get"));
      if (option.method == 'get') {
        response = await _dio.request(url, queryParameters: newParams, options: option);
      } else {
        response = await _dio.request(url, data: newParams, options: option);
      }
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  ///清除授权
  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }

  /// 上传图片
  Future<Response> uploadImg(url, FormData formData) async {
    Response response;
    response = await _dio.post(
      //此处更换为自己的上传文件接口
        url,
        data: formData,
        onSendProgress: (send, total) {
          print('已发送：$send  总大小：$total');
        }
    );
    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();
