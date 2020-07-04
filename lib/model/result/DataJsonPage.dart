

class DataJsonPage {
  DataBean data;
  int code;
  String msg;

  static DataJsonPage fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataJsonPage dataJsonPageBean = DataJsonPage();
    dataJsonPageBean.data = DataBean.fromMap(map['data']);
    dataJsonPageBean.code = map['code'];
    dataJsonPageBean.msg = map['msg'];
    return dataJsonPageBean;
  }

  Map toJson() => {
    "data": data,
    "code": code,
    "msg": msg,
  };
}

/// count : 4308
/// rows : []

class DataBean {
  int count;
  List<dynamic> rows;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.count = map['count'];
    dataBean.rows = map['rows'];
    return dataBean;
  }

  Map toJson() => {
    "count": count,
    "rows": rows,
  };
}