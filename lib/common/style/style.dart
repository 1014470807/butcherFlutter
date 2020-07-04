import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///颜色
class AppColors {

  static const int mainColor = 0xff42E8CA;
  static const int tabTextColor = 0xff8E8E93;
  static const int mainLoginBgColor = 0xffF1F2F5;
  static const int mainBgColor = 0xffF8F8F8;
  static const int textHintColor = 0xff8E8E93;
  static const int toastBgColor = 0xffd2d4d7;
}

///文本样式
class AppConstant{

  static const tabTextSize = 10.0;
  static double defalutSize = 28;
  static double bigSize = 34;
  static double minSize = 24;
  static double AminSize = 20;
  static Color defalutColor = Color.fromRGBO(0, 0, 0, 1);
  static Color priceColor = Color.fromRGBO(241, 18, 45, 1);
  static Color grayColor = Color.fromRGBO(142, 142, 147, 1);
  static Color themeColor = Color(0xFF222222);
  static Color theme2Color = Color(0xFFFFFFFF);
  static Color fontColor = Colors.white30;
  static int tabIndex = 3;
  static ThemeData themeData = new ThemeData.dark();
  static bool dark = true;
  static const selectTabText = TextStyle(
    color: Color(AppColors.mainColor),
    fontSize: tabTextSize,
  );
  static const unselectTabText = TextStyle(
    color: Color(AppColors.tabTextColor),
    fontSize: tabTextSize,
  );
  static Border borderBottom({Color color, bool show = true}){
    return Border(
        bottom: BorderSide(
            color: (color == null || !show)  ? (show ? Color.fromRGBO(242, 242, 242, 1) : Colors.transparent) : color,
            width: 1
        )
    );
  }
}

class AppICons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const IconData HOME = const IconData(0xe624, fontFamily: AppICons.FONT_FAMILY);
  static const IconData MORE = const IconData(0xe674, fontFamily: AppICons.FONT_FAMILY);
  static const IconData SEARCH = const IconData(0xe61c, fontFamily: AppICons.FONT_FAMILY);
}
class StyleBase {
  num dw(double dessignValue) => ScreenUtil.getInstance().setWidth(dessignValue);
  num dh(double dessignValue) => ScreenUtil.getInstance().setHeight(dessignValue);
  num ds(double dessignValue) => ScreenUtil.getInstance().setSp(dessignValue);
}
