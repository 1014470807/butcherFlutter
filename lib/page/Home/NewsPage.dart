import 'dart:convert';

import 'package:butcher/common/public/public.dart';
import 'package:butcher/common/dao/News_dao.dart';
import 'package:butcher/components/widget_load_header.dart';
import 'package:butcher/model/News/Article.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:butcher/components/widget_load_footer.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin,StyleBase {

  String a = "";
  bool _loading = true;
  int page =0;
  List<Article> list = [];
  EasyRefreshController _Controller;

  getData() {
    NewsDao.article(page).then((res){
      DataJsonArray data = DataJsonArray.fromMap(res);
      if(data.code==100){
        data.data.forEach((item){
          Article article = Article.fromMap(item);
          list.add(article);
        });
        this._loading = false;
        if(data.data.length<10){
          _Controller.finishLoad(noMore: true);
        }
        setState(() {
          list=list;
          _loading=false;
        });
        print(this.page);
        print(jsonEncode(list));
      }
    });
  }

  @override
  bool get wantKeepAlive => true; ///see AutomaticKeepAliveClientMixin

  @override
  void initState() {
    _Controller = EasyRefreshController();
    this.getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _Controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  Widget wordsCard(Article item) {
    Widget markWidget;
    markWidget = new Row(
      children: <Widget>[
        // new Expanded(
        //   flex: 2,
        //   child: new Container(
        //     child: new Text(
        //         "这是内容",
        //         style: new TextStyle(height: 1.3, color: AppConstant.fontColor)
        //     ),
        //   ),
        // ),
//        new Expanded(
//            flex: 1,
//            child: new AspectRatio(
//                aspectRatio: 3.0 / 2.0,
//                child: new Container(
//                  foregroundDecoration:new BoxDecoration(
//                      image: new DecorationImage(
//                        image: new NetworkImage(article.imgUrl),
//                        centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//                      ),
//                      borderRadius: const BorderRadius.all(const Radius.circular(6.0))
//                  ),
//                )
//            )
//        ),
      ],
    );
    return new Container(
        color: Colors.white10,
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: new FlatButton(
          onPressed: (){
            NavigatorUtils.goNewsDetail(context, item);
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Text("${item.articleTag}", style: new TextStyle(color: AppConstant.fontColor))
                  ],
                ),
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Container(
                  child: new Text(
                      "${item.articleTitle}",
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, height: 1.3, color: AppConstant.theme2Color)
                  ),
                  margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                  child: markWidget,
                  margin: new EdgeInsets.only(top: 6.0),
                  alignment: Alignment.topLeft
              ),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text("${item.articleTime}", style: new TextStyle(color: AppConstant.fontColor))
                    ),
                    new PopupMenuButton(
                        icon: new Icon(Icons.linear_scale, color: AppConstant.fontColor,),
                        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                          // new PopupMenuItem<String>(
                          //     value: '选项一的值',
                          //     child: new Text('屏蔽这个问题')
                          // ),
                          // new PopupMenuItem<String>(
                          //     value: '选项二的值',
                          //     child: new Text('取消关注 learner')
                          // ),
                          new PopupMenuItem<String>(
                              value: '选项二的值',
                              child: new Text("举报")
                          )
                        ]
                    )
                  ],
                ),
                padding: const EdgeInsets.only(),
              )
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); /// see AutomaticKeepAliveClientMixin
    return Scaffold(
      appBar: new AppBar(
        title: Text("时事新闻"),
        centerTitle: true,
      ),
      body: LoadingContainer(
        isLoading: _loading,
        child: EasyRefresh(
            child: Column(
              children: list.asMap().map((k,v)=>
                  MapEntry(k,wordsCard(v))
              ).values.toList(),
            ),
            footer: LoadFooter(),
            header: LoadHeader(),
            onRefresh: () async {
              this.page=0;
              this.list.clear();
              setState(() {
                page=page;
                list=list;
              });
              _Controller.finishLoad(noMore: false);
              getData();
            },
            controller: _Controller,
            onLoad: () async {
              this.page=this.page+1;
              setState(() {
                page=page;
              });
              getData();
            }
        ),
      )
    );
  }
}
