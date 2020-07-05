

///地址数据
class Address {

  static const String host = "http://106.54.53.151:7001";

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
