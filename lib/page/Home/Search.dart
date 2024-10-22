import 'package:butcher/common/public/public.dart';

class SearchPage extends StatefulWidget{
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  Widget searchInput() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: new Icon(Icons.arrow_back, color: AppConstant.themeColor),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "功能暂未开放",
                  hintStyle: new TextStyle(color: AppConstant.grayColor)
              ),
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: AppConstant.themeColor
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: searchInput(),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Text("比乎热搜", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                margin: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                alignment: Alignment.topLeft,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    child: new Chip(
                      label: new FlatButton(onPressed: (){
                        ToastUtils.showToast("功能暂未开放");
                      }, child: new Text("今日热点",style: new TextStyle(color: AppConstant.themeColor),)),
                      backgroundColor: AppConstant.dark == true ? Colors.white10 : Colors.black12,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                    alignment: Alignment.topLeft,
                  ),
                  // new Container(
                  //   child: new Chip(
                  //     label: new FlatButton(onPressed: (){}, child: new Text("李彦宏传闻辟谣",style: new TextStyle(color: AppConstant.themeColor))),
                  //     backgroundColor: AppConstant.dark == true ? Colors.white10 : Colors.black12,
                  //   ),
                  //   margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  //   alignment: Alignment.topLeft,
                  // ),
                ],
              ),
              // new Row(
              //   children: <Widget>[
              //     new Container(
              //       child: new Chip(
              //         label: new FlatButton(onPressed: (){}, child: new Text("小米8",style: new TextStyle(color: AppConstant.themeColor))),
              //         backgroundColor: AppConstant.dark == true ? Colors.white10 : Colors.black12,
              //       ),
              //       margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              //       alignment: Alignment.topLeft,
              //     ),
              //     new Container(
              //       child: new Chip(
              //         label: new FlatButton(onPressed: (){}, child: new Text("超时空同居",style: new TextStyle(color: AppConstant.themeColor))),
              //         backgroundColor: AppConstant.dark == true ? Colors.white10 : Colors.black12,
              //       ),
              //       margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              //       alignment: Alignment.topLeft,
              //     ),
              //   ],
              // ),
              // new Container(
              //   child: new Text("搜索历史", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              //   margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              //   alignment: Alignment.topLeft,
              // ),
              // new Container(
              //   child: new Row(
              //     children: <Widget>[
              //       new Container(
              //         child: new Icon(Icons.access_time, color: AppConstant.themeColor, size: 16.0),
              //         margin: const EdgeInsets.only(right: 12.0),
              //       ),
              //       new Expanded(
              //         child: new Container(
              //           child: new Text("业余兴趣", style: new TextStyle( color: AppConstant.themeColor, fontSize: 14.0),),
              //         ),
              //       ),
              //       new Container(
              //         child: new Icon(Icons.clear, color: AppConstant.themeColor, size: 16.0),
              //       )
              //     ],
              //   ),
              //   margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   decoration: new BoxDecoration(
              //       border: new BorderDirectional(bottom: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12))
              //   ),
              // ),
              // new Container(
              //   child: new Row(
              //     children: <Widget>[
              //       new Container(
              //         child: new Icon(Icons.access_time, color: AppConstant.themeColor, size: 16.0),
              //         margin: const EdgeInsets.only(right: 12.0),
              //       ),
              //       new Expanded(
              //         child: new Container(
              //           child: new Text("三体", style: new TextStyle( color: AppConstant.themeColor, fontSize: 14.0),),
              //         ),
              //       ),
              //       new Container(
              //         child: new Icon(Icons.clear, color: AppConstant.themeColor, size: 16.0),
              //       )
              //     ],
              //   ),
              //   margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   decoration: new BoxDecoration(
              //       border: new BorderDirectional(bottom: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12))
              //   ),
              // ),
              // new Container(
              //   child: new Row(
              //     children: <Widget>[
              //       new Container(
              //         child: new Icon(Icons.access_time, color: AppConstant.themeColor, size: 16.0),
              //         margin: const EdgeInsets.only(right: 12.0),
              //       ),
              //       new Expanded(
              //         child: new Container(
              //           child: new Text("人类未来", style: new TextStyle( color: AppConstant.themeColor, fontSize: 14.0),),
              //         ),
              //       ),
              //       new Container(
              //         child: new Icon(Icons.clear, color: AppConstant.themeColor, size: 16.0),
              //       )
              //     ],
              //   ),
              //   margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   decoration: new BoxDecoration(
              //       border: new BorderDirectional(bottom: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12))
              //   ),
              // ),
            ],
          ),
        )
    );
  }
}