

class User {
  UserBean data;
  int code;
  String msg;

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User userBean = User();
    userBean.data = UserBean.fromMap(map['data']);
    userBean.code = map['code'];
    userBean.msg = map['msg'];
    return userBean;
  }

  Map toJson() => {
    "data": data,
    "code": code,
    "msg": msg,
  };
}

/// userid : "e8c5ff10-48b2-11ea-a0e1-117fb150a6de"
/// account : "1014470807"
/// username : "1014470807"
/// phone : 0
/// experience : 1
/// collections : [{"code":600314}]
/// token : "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImNvcnBpZCI6ImJ1dGNoZXIiLCJ1c2VyaWQiOiJlOGM1ZmYxMC00OGIyLTExZWEtYTBlMS0xMTdmYjE1MGE2ZGUifSwiZXhwIjoxNTgyMzc0NDQ1LCJpYXQiOjE1ODIzNjcyNDV9.TCBeaH9vQ2tjTBc6E7nFkIxbfvpl648SCOLnvPvsRgE8St9PgS2VPuosQrO1gQm951F8geEhi7A6T6n862W1ZsjKF5OoLnVtHxHakfLtJvONiugJu-W1EIzyI5wBGkOn-R7jBC19wRSN9p8dCECKKf8XA1aYljtQD059wQ_5EmY"

class UserBean {
  String userid;
  String account;
  String username;
  int phone;
  int experience;
  List<CollectionsBean> collections;
  String token;

  static UserBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserBean dataBean = UserBean();
    dataBean.userid = map['userid'];
    dataBean.account = map['account'];
    dataBean.username = map['username'];
    dataBean.phone = map['phone'];
    dataBean.experience = map['experience'];
    dataBean.collections = List()..addAll(
      (map['collections'] as List ?? []).map((o) => CollectionsBean.fromMap(o))
    );
    dataBean.token = map['token'];
    return dataBean;
  }

  Map toJson() => {
    "userid": userid,
    "account": account,
    "username": username,
    "phone": phone,
    "experience": experience,
    "collections": collections,
    "token": token,
  };
}

/// code : 600314

class CollectionsBean {
  int code;

  static CollectionsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CollectionsBean collectionsBean = CollectionsBean();
    collectionsBean.code = map['code'];
    return collectionsBean;
  }

  Map toJson() => {
    "code": code,
  };
}