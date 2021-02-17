import 'package:butcher/common/net/address.dart';
import 'package:butcher/common/net/api.dart';
import 'package:dio/dio.dart';

class NewsDao {

  static article(int page) async {
    Map<String, dynamic> requestParams = new Map();
    requestParams = {
      "page": page,
      "size": 10
    };
    print(requestParams);
    var res = await httpManager.netFetch(
        Address.article(), requestParams, null, new Options(method: "get"));
    return res;
  }

  static jinshi(int page) async {
    Map<String, dynamic> requestParams = new Map();
    requestParams = {
      "page": page,
      "size": 10
    };
    //print(requestParams);
    var res = await httpManager.netFetch(
        Address.jinshi(), requestParams, null, new Options(method: "get"));
    return res;
  }

  static getTodayAll(int page) async {
    Map<String, dynamic> requestParams = new Map();
    requestParams = {
      "page": page,
      "size": 20
    };
    //print(requestParams);
    var res = await httpManager.netFetch(
        Address.getTodayAll(), requestParams, null, new Options(method: "get"));
    return res;
  }

  static getTradingNews (int page, int status) async {
    Map<String, dynamic> requestParams = new Map();
    requestParams = {
      "page": page,
      "size": 10,
      "status": status
    };
    //print(requestParams);
    var res = await httpManager.netFetch(
        Address.getTradingNews(), requestParams, null, new Options(method: "get"));
    return res;
  }
}