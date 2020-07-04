import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:butcher/common/style/style.dart';

class ToastUtils {

  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIos: 1,
        backgroundColor: Color(AppColors.toastBgColor),
        textColor: Colors.white
    );
  }

  static hideToast(){
    Fluttertoast.cancel();
  }

}