import 'package:butcher/common/public/public.dart';
import 'dart:convert';
import 'package:butcher/common/utils/toast_utils.dart';
import 'package:butcher/common/dao/user_dao.dart';
import 'package:butcher/redux/butcher_state.dart';
import 'package:butcher/redux/middleware/epic.dart';
import 'package:butcher/redux/middleware/epic_store.dart';
import 'package:butcher/common/utils/navigator_utils.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/common/config/config.dart';
import 'package:butcher/common/local/local_storage.dart';
import 'package:butcher/page/Index/index.dart';
import 'package:butcher/redux/user_redux.dart';

/// 登录相关Redux
/// Created by guoshuyu
/// Date: 2018-07-16
final LoginReducer = combineReducers<bool>([
  ///将login: LoginReducer(state.login, action) 中的state.login变量传递到bool，指明返回一个bool类型，action传递给LoginSuccessAction
  ///每次用户调用（不管是主动还是被动）LoginSuccessAction，最终都会触发_loginResult方法
  ///_loginResult方法：
  ///       返回类型：BUTCHERState传递过来的变量，用于改变BUTCHERState中的变量
  ///       参数：需要和BUTCHERState传递过来的变量类型一模一样，而其中的LoginSuccessAction action 变量可获取LoginSuccessAction类中用户传递过来的变量
  TypedReducer<bool, LoginSuccessAction>(_loginResult),
  TypedReducer<bool, LogoutAction>(_logoutResult),
]);

bool _loginResult(bool result, LoginSuccessAction action) {
  AppConstant.tabIndex=4;
  Navigator.pushNamedAndRemoveUntil(action.context,IndexPage.sName,ModalRoute.withName('/'));
  return action.success;
}

bool _logoutResult(bool result, LogoutAction action) {
  return action.success;
}

class LoginSuccessAction {
  final BuildContext context;
  final bool success;
  final String type;

  LoginSuccessAction(this.context, this.success,this.type);
}

class LogoutAction {
  final BuildContext context;
  final bool success;
  LogoutAction(this.context,this.success);
}

///当调用该方法时，会执行LoginEpic类下面的方法
///登录
class LoginAction {
  final BuildContext context;
  final String type;
  final UserBean user;
  LoginAction(this.context, this.type, this.user);
}

class LoginMiddleware implements MiddlewareClass<BUTCHERState> {
  @override
  void call(Store<BUTCHERState> store, dynamic action, NextDispatcher next) {
    ///退出登录
    if (action is LogoutAction) {
      //UserDao.clearAll(store);
      LogoutAction(action.context,action.success);
      //NavigatorUtils.goLogin(action.context);
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

class LoginEpic implements EpicClass<BUTCHERState> {

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<BUTCHERState> store) {

    return Observable(actions)
        .whereType<LoginAction>()
        .switchMap((action) => _loginIn(action, store));
  }

  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<BUTCHERState> store) async* {
//    var res = await UserDao.login(
//      action.type,
//      action.hashMap,
//      store);
//    Navigator.pop(action.context);
//    ToastUtils.showToast(res.data);

    ///保存用户信息
    LocalStorage.save(Config.USER_INFO, json.encode(action.user.toJson()));
    ///保存token
    LocalStorage.save(Config.TOKEN_KEY, action.user.token);

    var token = LocalStorage.get(Config.TOKEN_KEY);
    print("登录返回的token:"+action.user.token);
    store.dispatch(new UpdateUserAction(action.user));
    ///调用LoginSuccessAction方法
    yield LoginSuccessAction(action.context, true, action.type);
  }

}
