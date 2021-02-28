import 'dart:convert';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/redux/login_redux.dart';
import 'package:butcher/redux/user_redux.dart';
import 'package:dio/dio.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/local/local_storage.dart';
import 'dart:convert';
import 'package:butcher/common/net/address.dart';
import 'package:butcher/common/net/api.dart';
import 'package:butcher/model/result/DataJson.dart';

class UserDao {

  static register(String account,String password,int experience) async {
    Map<String,dynamic> requestParams = new Map();
    requestParams = {
      "account": account,
      "password": password,
      "username": account,
      "experience": experience
    };
    var res = await httpManager.netFetch(Address.register(), requestParams, null, new Options(method: "post"));
    return res;
  }

  static login(String account,String password) async {
    Map<String,dynamic> requestParams = new Map();
    requestParams = {
      "account": account,
      "password": password
    };
    var res = await httpManager.netFetch(Address.login(), requestParams, null, new Options(method: "post"));
    return res;
  }

  static clearLogin(String userid) async {
    Map<String,dynamic> requestParams = new Map();
    requestParams = {
      "userid": userid
    };
    var res = await httpManager.netFetch(Address.clearLogin(), requestParams, null, new Options(method: "post"));
    return res;
  }

  static clearAll(Store store) async {
    httpManager.clearAuthorization();
    LocalStorage.remove(Config.USER_INFO);
    LocalStorage.remove(Config.TOKEN_KEY);
  }

}