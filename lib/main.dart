import 'package:butcher/common/public/public.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:butcher/page/public/welcomePage.dart';
import 'package:butcher/page/Index/index.dart';
import 'dart:io';
import 'package:butcher/common/utils/navigator_utils.dart';
import 'package:butcher/common/net/code.dart';
import 'package:redux/redux.dart';
import 'package:butcher/redux/butcher_state.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/page/My/MyPage.dart';

void main(){
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  // 强制竖屏
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown
//  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MyAppFul(context: context);
  }
}

class MyAppFul extends StatefulWidget {

  final BuildContext context;
  MyAppFul({this.context}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }
}

class MyAppState extends State<MyAppFul> with HttpErrorListener {

  /// 创建Store，引用 GSYState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = new Store<BUTCHERState>(
    ///负责更新State的函数
      appReducer,

      ///拦截器
      middleware: middleware,

      ///初始化数据
      initialState: new BUTCHERState()
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /// 使用 flutter_redux 做全局状态共享
    /// 通过 StoreProvider 应用 store
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<BUTCHERState>(builder: (context, store) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppConstant.themeData,
          routes: {
            WelcomePage.sName: (context) {
              _context = context;
              return WelcomePage();
            },
            IndexPage.sName: (context) {
              _context = context;
              return NavigatorUtils.pageContainer(new IndexPage(AppConstant.tabIndex));
            },
          });
      }),
    );
  }

}

mixin HttpErrorListener on State<MyAppFul> {
  StreamSubscription stream;

  ///这里为什么用 _context 你理解吗？
  ///因为此时 State 的 context 是 FlutterReduxApp 而不是 MaterialApp
  ///所以如果直接用 context 是会获取不到 MaterialApp 的 Localizations 哦。
  BuildContext _context;

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
//    stream = eventBus.on<HttpErrorEvent>().listen((event) {
//      errorHandleFunction(event.code, event.message);
//    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        ToastUtils.showToast("网络异常");
        break;
      case 401:
        ToastUtils.showToast("[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]");
        break;
      case 403:
        ToastUtils.showToast("403权限错误");
        break;
      case 404:
        ToastUtils.showToast("404错误");
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        ToastUtils.showToast("请求超时");
        break;
      default:
        ToastUtils.showToast("其他异常"+" "+message);
        break;
    }
  }
}


