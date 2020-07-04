

class DataJson {
  DataBean data;
  int code;
  String msg;

  static DataJson fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataJson dataJsonBean = DataJson();
    dataJsonBean.data = DataBean.fromMap(map['data']);
    dataJsonBean.code = map['code'];
    dataJsonBean.msg = map['msg'];
    return dataJsonBean;
  }

  Map toJson() => {
    "data": data,
    "code": code,
    "msg": msg,
  };
}


class DataBean {

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    return dataBean;
  }

  Map toJson() => {
  };
}