///正则判断
class RegularUtils {

  ///手机号验证
  static bool isChinaPhoneLegal(String str) {
    return RegExp(
        r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  ///邮箱验证
  static bool isEmail(String str) {
    return RegExp(
        r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
        .hasMatch(str);
  }

  ///密码验证
  static bool isLegalPass(String str) {
    return RegExp(
        r"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$")
        .hasMatch(str);
  }

}