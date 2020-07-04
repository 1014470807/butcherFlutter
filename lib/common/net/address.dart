

///地址数据
class Address {

  static const String host = "http://192.168.1.107:7001";

  ///----------------------首页----------------------
  static register() {
    return "${host}/register";
  }

  static login() {
    return "${host}/login";
  }

  static article() {
    return "${host}/article";
  }

  static jinshi() {
    return "${host}/getjinshi";
  }
}
