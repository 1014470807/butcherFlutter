import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/public/public.dart';
//import 'package:butcher/common/service/NavigateService.dart';
//import 'package:butcher/common/service/service_locator.dart';
//import 'package:butcher/page/login/loginPage.dart';
import 'package:butcher/page/public/welcomePage.dart';

/// Log 拦截器

class LogsInterceptors extends InterceptorsWrapper {
  static List<Map> sHttpResponses = new List<Map>();
  static List<String> sResponsesHttpUrl = new List<String>();

  static List<Map<String, dynamic>> sHttpRequest =
  new List<Map<String, dynamic>>();
  static List<String> sRequestHttpUrl = new List<String>();

  static List<Map<String, dynamic>> sHttpError =
  new List<Map<String, dynamic>>();
  static List<String> sHttpErrorUrl = new List<String>();

  Map<String,dynamic> errorData = new Map();

  @override
  onRequest(RequestOptions options) async {
    if (Config.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    try {
      addLogic(sRequestHttpUrl, options.path ?? "");
      var data = options.data ?? Map<String, dynamic>();
      var map = {
        "header:": {...options.headers},
      };
      if (options.method == "POST") {
        map["data"] = data;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      print(e);
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Config.DEBUG) {
      if (response != null) {

        if (errorData.keys.length == 0){
          errorData = await loadErrorCodeData();
        }
        Map<String,dynamic> res = json.decode(response.toString());

        //错误码提示
        if (res["resultCode"] != 100) {
          ToastUtils.showToast(errorData[res["resultCode"].toString()]);

//          //重新登录
//          if (res["resultCode"] == -1) {
//            locator<NavigationService>().navigateTo(LoginPage.sName);
//          }

        }

//        print("错误码"+errorData.toString());
        print('返回参数: ' + response.toString());
      }
    }
    if (response.data is Map || response.data is List) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response?.request?.uri?.toString() ?? "");
        addLogic(sHttpResponses, data);
      } catch (e) {
        print(e);
      }
    } else if (response.data is String) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response?.request?.uri.toString() ?? "");
        addLogic(sHttpResponses, data);
      } catch (e) {
        print(e);
      }
    } else if (response.data != null) {
      try {
        String data = response.data.toJson();
        addLogic(sResponsesHttpUrl, response?.request?.uri.toString() ?? "");
        addLogic(sHttpResponses, json.decode(data));
      } catch (e) {
        print(e);
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) async {
    if (Config.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    try {
      addLogic(sHttpErrorUrl, err.request.path ?? "null");
      var errors = Map<String, dynamic>();
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      print(e);
    }
    return err; // continue;
  }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }

  static loadErrorCodeData() async {

    Completer completer = new Completer();

//    await rootBundle.loadString('static/data/errorCode.json').then((value) {
//      Map errorCodeData = json.decode(value);
//      completer.complete(errorCodeData);
//
//    }).catchError((err) {
//      completer.completeError(err);
//
//    });

    return completer.future;

  }

}
