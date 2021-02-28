import 'package:flutter/material.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/redux/middleware/epic_middleware.dart';
import 'package:butcher/redux/user_redux.dart';
import 'package:butcher/redux/login_redux.dart';
import 'package:redux/redux.dart';

/**
 * Redux全局State
 * Created by guoshuyu
 * Date: 2018-07-16
 */

///全局Redux store 的对象，保存State数据
@immutable
class BUTCHERState {
  ///用户信息
  UserBean userInfo;
  ///是否登录
  bool login;

  ///构造方法
  BUTCHERState({this.userInfo,this.login});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
BUTCHERState appReducer(BUTCHERState state, action) {
  return BUTCHERState(
    ///通过 UserReducer 将 BUTCHERState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    login: LoginReducer(state.login, action)
  );
}


///定义redux中间件，类似拦截器
final List<Middleware<BUTCHERState>> middleware = [
  EpicMiddleware<BUTCHERState>(UserInfoEpic()),
  UserInfoMiddleware(),
  LoginMiddleware(),
  EpicMiddleware<BUTCHERState>(LoginEpic()),
];
