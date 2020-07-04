

class JinshiModel {
  int id;
  String title;
  String time;
  String createTime;

  static JinshiModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    JinshiModel jinshiModelBean = JinshiModel();
    jinshiModelBean.id = map['id'];
    jinshiModelBean.title = map['title'];
    jinshiModelBean.time = map['time'];
    jinshiModelBean.createTime = map['createTime'];
    return jinshiModelBean;
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "time": time,
    "createTime": createTime,
  };
}