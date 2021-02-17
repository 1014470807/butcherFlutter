import 'package:butcher/common/public/public.dart';
import 'package:butcher/page/Home/AskPage.dart';
import 'package:butcher/page/Home/Search.dart';
import 'package:butcher/page/Home/Head.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'package:butcher/page/Home/widget/jinshi.dart';
import 'package:butcher/page/Home/widget/stockToday.dart';
import 'package:mop/mop.dart';
import 'package:butcher/page/Home/widget/tradingTab.dart';
import 'package:butcher/page/Home/widget/currency.dart';
import 'package:butcher/page/Home/widget/cryptocurrencies.dart';
import 'package:butcher/page/Home/widget/futures.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StyleBase,AutomaticKeepAliveClientMixin {
  List<String> navList =["今日热点","A股排行榜","A股动态","外汇市场","加密货币","期货市场"];
  ScrollController _scrollController = ScrollController();
  List<Widget> wList = [
    Jinshi(),
    stockToday(),
    tradingTab(),
    currency(),
    cryptocurrencies(),
    futures()
  ];

  @override
  void initState() {
    super.initState();
  }


  Widget barSearch() {
    return new Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQueryData.fromWindow(window).padding.top + dw(55),
        child: Row(
          children: <Widget>[
            FlatButton(
              child: Container(
                child: Text("123"),
                width: dw(100),
                margin: EdgeInsets.only(right: dw(32),left: dw(32)),
              ),
              onPressed: () {
                Mop.instance.openApplet('6029eb9cfb91860001b4e78f');
              },
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
              builder: (context) => wList[k],
            ),),
            ).values.toList(),
          ),
        ),
      ),
    );
  }
}
