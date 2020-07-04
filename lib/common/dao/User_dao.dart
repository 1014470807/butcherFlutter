import 'dart:convert';
import 'package:butcher/common/public/public.dart';
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
}