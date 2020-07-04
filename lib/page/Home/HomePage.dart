import 'package:butcher/common/public/public.dart';
import 'package:butcher/page/Home/AskPage.dart';
import 'package:butcher/page/Home/Search.dart';
import 'package:butcher/page/Home/Head.dart';
import 'dart:ui';

import 'package:butcher/page/Home/widget/jinshi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StyleBase,AutomaticKeepAliveClientMixin {
  List<String> navList =["实时新闻","龙虎榜","板块排行","最新动态","最新资讯","最新资讯"];
  ScrollController _scrollController = ScrollController();
  List<Widget> wList = [
    Jinshi(),
    Container(
      child: Text("323"),
    ),Container(
      child: Text("123"),
    ),
    Container(
      child: Text("123"),
    ),
    Container(
      child: Text("123"),
    ),Container(
      child: Text("123"),
    )
  ];


  Widget barSearch() {
    return new Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQueryData.fromWindow(window).padding.top + dw(55),
        child: Row(
          children: <Widget>[
            Container(
              child: Text("123"),
              width: dw(100),
              margin: EdgeInsets.only(right: dw(32),left: dw(32)),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: dw(32)),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new FlatButton.icon(
                          onPressed: (){
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) {
                                  return new SearchPage();
                                }
                            ));
                          },
                          icon: new Icon(
                              Icons.search,
                              color: AppConstant.themeColor,
                              size: 16.0
                          ),
                          label: new Text(
                            "坚果R1摄像头损坏",
                            style: new TextStyle(color: AppConstant.themeColor),
                          ),
                        )
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                  borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
                  color: AppConstant.theme2Color,
                )
              ),
            )
          ],
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: navList.length == 0 ? null : DefaultTabController(
        length: navList.length,
        child: NestedScrollView(  // 嵌套式滚动视图
          controller: _scrollController,
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            /// 使用[SliverAppBar]组件实现下拉收起头部的效果
            SliverAppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 100,
              actions: <Widget>[
                barSearch(),
//                DyHeader(
//                  decoration: BoxDecoration(
//                    color: Colors.transparent,
//                  ),
//                  gray: true,
//                )
              ],
              flexibleSpace: FlexibleSpaceBar(  // 下拉渐入背景
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 1),
                      end: Alignment(0.0, -0.7),
                      colors: <Color>[
                        Color(0xffffffff),
                        Colors.blue
                      ],
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
                labelColor: Colors.blue,
                indicatorColor: Colors.blue,
                indicatorPadding: EdgeInsets.only(bottom: dw(7)),
                unselectedLabelColor: Color(0xff333333),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: navList.map((e) => Tab(
                  child: Text(e.toString()),
                )
                ).toList(),
              ),
              forceElevated: innerScrolled,
            ),
          ],
          body: TabBarView(
            children: navList.asMap().map((k, tab) => MapEntry(k, Builder(
              builder: (context) => Jinshi(),
            ),),
            ).values.toList(),
          ),
        ),
      ),
    );
  }
}
