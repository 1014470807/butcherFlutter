import 'package:butcher/common/public/public.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:butcher/model/News/Article.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetail extends StatefulWidget {
  Article article;
  NewsDetail(this.article);
  @override
  _NewsDetailState createState() => _NewsDetailState(this.article);
}

class _NewsDetailState extends State<NewsDetail> {
  Article article;
  _NewsDetailState(this.article);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text("${article.articleTitle}",maxLines: 1,)
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new ListTile(
                  leading: new CircleAvatar(
                      backgroundImage: new NetworkImage("https://pic3.zhimg.com/v2-cd467bb9bb31d0384f065cf0bd677930_xl.jpg"),
                      radius: 20.0
                  ),
                  title: new Text("${article.articleTitle}"),
                  subtitle: new Text("${article.articleTag}"),
                  trailing: new RaisedButton.icon(onPressed: (){}, icon: new Icon(Icons.add, color: Colors.white), label: new Text("关注", style: new TextStyle(color: Colors.white),), color: Colors.blue,)
              ),
              decoration: new BoxDecoration(
                  color: AppConstant.themeColor,
                  border: new BorderDirectional(bottom: new BorderSide(color: Colors.white10))
              ),
            ),
            new Container(
              child: Html(data: article.articleContent,),
              margin: const EdgeInsets.all(16.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
          child: new Container(
            height: 50.0,
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new FlatButton.icon(onPressed: (){}, label: new Text("赞同 10 K"), color: Colors.white10, icon: new Icon(Icons.arrow_drop_up),),
                  margin: new EdgeInsets.only(left: 16.0),
                  height: 30.0,
                ),
                new Container(
                  child: new IconButton(onPressed: (){}, icon: new Icon(Icons.arrow_drop_down),padding: const EdgeInsets.all(0.0)),
                  margin: new EdgeInsets.only(left: 8.0),
                  height: 30.0,
                  decoration: new BoxDecoration(
                    borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
                    color: Colors.white10,
                  ),
                ),
                new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new IconButton(
                            onPressed: (){ print("icon");},
                            icon: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new Icon(Icons.favorite, size: 18.0, color: AppConstant.fontColor,),
                                  new Text("感谢", style: new TextStyle(fontSize: 10.0, color: AppConstant.fontColor),)
                                ],
                              ),
                              margin: const EdgeInsets.only(),
                              height: 30.0,
                            )
                        ),
                        new IconButton(
                            onPressed: (){ print("icon");},
                            icon: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new Icon(Icons.star, size: 18.0, color: AppConstant.fontColor,),
                                  new Text("收藏", style: new TextStyle(fontSize: 10.0, color: AppConstant.fontColor),)
                                ],
                              ),
                              margin: const EdgeInsets.only(),
                              height: 30.0,
                            )
                        ),
                        new IconButton(
                            onPressed: (){ print("icon");},
                            icon: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new Icon(Icons.mode_comment, size: 18.0, color: AppConstant.fontColor,),
                                  new Text("345", style: new TextStyle(fontSize: 10.0, color: AppConstant.fontColor),)
                                ],
                              ),
                              margin: const EdgeInsets.only(),
                              height: 30.0,
                            )
                        ),
                      ],
                    )
                )
              ],
            ),
            color: AppConstant.themeColor,
          )
      ),
    );
  }
}
