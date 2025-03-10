import 'package:butcher/model/User/User.dart';
import 'package:butcher/redux/butcher_state.dart';
import 'package:butcher/redux/middleware/epic.dart';
import 'package:butcher/redux/middleware/epic_store.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

/**
 * 用户相关Redux
 * Created by guoshuyu
 * Date: 2018-07-16
 */

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<UserBean>([
  TypedReducer<UserBean, UpdateUserAction>(_updateLoaded),
]);

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
UserBean _updateLoaded(UserBean user, action) {
  user = action.userInfo;
  return user;
}

///定一个 UpdateUserAction ，用于发起 userInfo 的的改变
///类名随你喜欢定义，只要通过上面TypedReducer绑定就好
class UpdateUserAction {
  final UserBean userInfo;

  UpdateUserAction(this.userInfo);
}


class FetchUserAction {
}


class UserInfoMiddleware implements MiddlewareClass<BUTCHERState> {

  @override
  void call(Store<BUTCHERState> store, dynamic action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      print("中间件拦截到 ------ 更新用户");
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

class UserInfoEpic implements EpicClass<BUTCHERState> {
  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<BUTCHERState> store) {
    return Observable(actions)
        // to UpdateUserAction actions
        .whereType<FetchUserAction>()
        // Don't start  until the 10ms
        .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
        .switchMap((action) => _loadUserInfo());
  }

  // Use the async* function to make easier
  Stream<dynamic> _loadUserInfo() async* {
    print("*********** userInfoEpic _loadUserInfo ***********");
//    var res = await UserDao.getUserInfo(null);
//    yield UpdateUserAction(res.data);
  }
}