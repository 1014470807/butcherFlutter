import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/local/local_storage.dart';
//import 'package:butcher/common/net/graphql/client.dart';

/// Token拦截器
/// Created by guoshuyu
/// on 2019/3/23.
class TokenInterceptors extends InterceptorsWrapper {
  String _token = "";

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == "") {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != "") {
        _token = authorizationCode;
        //initClient(_token);
      }
    }
    options.headers["token"] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = "";
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if (token != null){
      token = "Bearer "+token;
      return token;
    } else {
      return "";
    }

  }
}
