
class TradingModel {
  int id;
  String title;
  String desc;
  String time;
  String author;
  String img;
  String status;

  static TradingModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TradingModel tradingModelBean = TradingModel();
    tradingModelBean.id = map['id'];
    tradingModelBean.title = map['title'];
    tradingModelBean.desc = map['desc'];
    tradingModelBean.time = map['time'];
    tradingModelBean.author = map['author'];
    tradingModelBean.img = map['img'];
    tradingModelBean.status = map['status'];
    return tradingModelBean;
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "time": time,
    "author": author,
    "img": img,
    "status": status,
  };
}