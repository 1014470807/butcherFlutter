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
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:butcher/page/update/update_dialog.dart';
// import 'package:mop/mop.dart';

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
  WidgetsFlutterBinding.ensureInitialized(); //必须要添加这个进行初始化 否则下面会错误
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
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

  String _platformVersion = 'Unknown';
  GlobalKey<UpdateDialogState> _dialogKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBugly.init(
      androidAppId: "cbf1ea33f4",
      iOSAppId: "cbf1ea33f4",
    ).then((_result) {
      setState(() {
        _platformVersion = _result.message;
        print(_result.appId);
      });
    });
    FlutterBugly.onCheckUpgrade.listen((_upgradeInfo) {
      _showUpdateDialog(_upgradeInfo.newFeature, _upgradeInfo.apkUrl,
          _upgradeInfo.upgradeType == 2);
    });
    FlutterBugly.setUserId("user id");
    FlutterBugly.putUserData(key: "key", value: "value");
    int tag = 9527;
    FlutterBugly.setUserTag(tag);
  }

  void _showUpdateDialog(String version, String url, bool isForceUpgrade) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => _buildDialog(version, url, isForceUpgrade),
    );
  }

  void _checkUpgrade() {
    print("获取更新中。。。");
    FlutterBugly.checkUpgrade();
  }

  Widget _buildDialog(String version, String url, bool isForceUpgrade) {
    return WillPopScope(
        onWillPop: () async => isForceUpgrade,
        child: UpdateDialog(
          key: _dialogKey,
          version: version,
          onClickWhenDownload: (_msg) {
            //提示不要重复下载
          },
          onClickWhenNotDownload: () {
            //下载apk，完成后打开apk文件，建议使用dio+open_file插件
            print('需要更新');
          },
        ));
  }

  //dio可以监听下载进度，调用此方法
  void _updateProgress(_progress) {
    setState(() {
      _dialogKey.currentState.progress = _progress;
    });
  }

  // Future<void> init() async {
  //   if (Platform.isIOS) {
  //     //com.finogeeks.mopExample
  //     final res = await Mop.instance.initialize(
  //         'f8poIsvI+4oweExNTnr8bstrItuz4IMBG9hwZhwtPuE=', 'e10964fa387365d0',
  //         apiServer: 'https://api.finclip.com', apiPrefix: '/api/v1/mop');
  //     print(res);
  //   } else if (Platform.isAndroid) {
  //     //com.finogeeks.mopexample
  //     final res = await Mop.instance.initialize(
  //         'f8poIsvI+4oweExNTnr8bstrItuz4IMBG9hwZhwtPuE=', 'e10964fa387365d0',
  //         apiServer: 'https://api.finclip.com', apiPrefix: '/api/v1/mop');
  //     print(res);
  //     print(111);
  //   }
  //   if (!mounted) return;
  // }

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


