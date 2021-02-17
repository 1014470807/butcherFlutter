import 'package:butcher/common/public/public.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:butcher/page/Home/HomePage.dart';
import 'package:butcher/page/My/MyPage.dart';
import 'package:butcher/page/Home/NewsPage.dart';

class IndexPage extends StatefulWidget {
  int index;
  IndexPage(this.index);
  static final String sName = "index";
  @override
  _IndexPageState createState() => _IndexPageState(index);
}

class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  int _page = 0;
  TabController tabController;
  GlobalKey _bottomNavigationKey = GlobalKey();
  _IndexPageState(this._page);

  DateTime _lastPressedAt;//上次点击时间

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5)..addListener((){
      setState(() {
        _page=tabController.index;
      });
    });
    setState(() {
      tabController.index=_page;
      _page=_page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
          //2次点击间隔超过1秒则重新记时
          _lastPressedAt = DateTime.now();
          ToastUtils.showToast("在按一次退出程序");
          return false;
        }
        return true;
      },
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            height: 50.0,
            items: <Widget>[
              Icon(Icons.add, size: 30,color: Colors.blue,),
              Icon(Icons.list, size: 30,color: Colors.blue,),
              Icon(Icons.compare_arrows, size: 30,color: Colors.blue,),
              Icon(Icons.call_split, size: 30,color: Colors.blue,),
              Icon(Icons.perm_identity, size: 30,color: Colors.blue,),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
              tabController.animateTo(index,duration: Duration(milliseconds: 300), curve: Curves.ease);
            },
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              NewsPage(),
              HomePage(),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              MyPage(),
            ],
          )
      ),
    );
  }
}
