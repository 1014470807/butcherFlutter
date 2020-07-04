import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/local/local_storage.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/common/utils/navigator_utils.dart';
import 'package:redux/redux.dart';
import 'package:butcher/redux/butcher_state.dart';
import 'package:butcher/page/Wave/Wave.dart';
import 'package:butcher/page/Wave/Countdown.dart';
/// 欢迎页
class WelcomePage extends StatefulWidget {

  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with StyleBase {
  bool hadInit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<BUTCHERState> store = StoreProvider.of(context);
//    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
//      NavigatorUtils.goIndex(context);
//    });

  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      body: Container(
        color: AppConstant.theme2Color,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: dw(25),
                top: dw(25),
                child: Container(
                  child: CountdownInit(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: dw(70)),),
                  Image.asset(
                    'static/images/init_logo.webp',
                    width: dw(300),
                  ),
                  Padding(padding: EdgeInsets.only(top: dw(70)),),
                  Image.asset(
                    'static/images/init_icon.png',
                    width: dw(90),
                  ),
                  WaveBtoom(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
