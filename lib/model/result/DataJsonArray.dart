

class DataJsonArray {
  List<dynamic> data;
  int code;
  String msg;

  static DataJsonArray fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataJsonArray dataJsonArrayBean = DataJsonArray();
    dataJsonArrayBean.data = map['data'];
    dataJsonArrayBean.code = map['code'];
    dataJsonArrayBean.msg = map['msg'];
    return dataJsonArrayBean;
  }

  Map toJson() => {
    "data": data,
    "code": code,
    "msg": msg,
  };
}