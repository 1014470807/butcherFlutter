import 'package:dio/dio.dart';
import 'package:butcher/common/net/code.dart';
import 'package:butcher/common/net/result_data.dart';
import 'package:butcher/common/utils/toast_utils.dart';

/// Token拦截器
/// Created by guoshuyu
/// on 2019/3/23.
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
    RequestOptions option = response.request;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = new ResultData(response.data, true, Code.SUCCESS);
      }
      else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      value = new ResultData(response.data, false, response.statusCode, headers: response.headers);
      ToastUtils.showToast("请求失败");
    }
    return value;
  }
}
