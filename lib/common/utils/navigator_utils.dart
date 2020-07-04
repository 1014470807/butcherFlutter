import 'package:butcher/common/public/public.dart';
import 'package:butcher/page/Index/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:butcher/page/Login/index.dart';
import 'package:butcher/page/Login/register.dart';
import 'package:butcher/page/Login/login.dart';
import 'package:butcher/page/Login/experience.dart';
import 'package:butcher/page/Home/NewsDetail.dart';
import 'package:butcher/model/News/Article.dart';


class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(
      ///不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }

  ///主页
  static goIndex(BuildContext context) {
    //Navigator.pushReplacementNamed(context, IndexPage.sName);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => IndexPage(AppConstant.tabIndex))
    );
  }

  static goLoginMethod(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        return LoginMethod();
      }
    ));
  }
  static goRegister(BuildContext context,int experience){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return new Register(experience);
        }
    ));
    //Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new Register()),(route) => route == null,);
  }
  static goLogin(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return Login();
        }
    ));
  }

  static goExperience(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return experience();
        }
    ));
  }

  static goNewsDetail(BuildContext context,Article article){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return NewsDetail(article);
        }
    ));
  }


}