

///地址数据
class Address {

  static const String host = "https://app.butcherhelp.cn/butcher";

  ///----------------------首页----------------------
  static register() {
    return "${host}/register";
  }

  static login() {
    return "${host}/login";
  }

  static clearLogin() {
    return "${host}/clearLogin";
  }

  static article() {
    return "${host}/article";
  }

  static jinshi() {
    return "${host}/getjinshi";
  }

  static getTodayAll() {
    return "${host}/getTodayAll";
  }

  static getTradingNews() {
    return "${host}/getTradingNews";
  }
}
