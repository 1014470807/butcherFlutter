import 'dart:convert';

import 'package:butcher/common/dao/News_dao.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/model/News/JinshiModel.dart';
import 'package:butcher/model/result/DataJsonPage.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Jinshi extends StatefulWidget {
  @override
  _JinshiState createState() => _JinshiState();
}

class _JinshiState extends State<Jinshi> with StyleBase,AutomaticKeepAliveClientMixin {

  List<JinshiModel> jinshi = [];
  int page = 0;
  EasyRefreshController _Controller;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  getData() {
    NewsDao.jinshi(page).then((res){
      DataJsonPage data = DataJsonPage.fromMap(res);
      if(data.code==100){
        data.data.rows.forEach((item){
          JinshiModel bean = JinshiModel.fromMap(item);
          jinshi.add(bean);
          print(bean.id);
        });

      }
    });
  }

  @override
  void initState() {
    _Controller = EasyRefreshController();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FlatButton(
      onPressed: (){
        getData();
      },
      child: Text("123"),
    );
//    return Card(
//      elevation: 0,
//      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
//      child: Stack(
//        fit: StackFit.loose,
//        children: <Widget>[
//          // 左边的竖线
//          Positioned(
//            left: 21,
//            top: 15,
//            bottom: 15,
//            child: VerticalDivider(
//              width: 1,
//            ),
//          ),
//          // 右边的事件列表
//          ListView.separated(
//            padding: EdgeInsets.zero,
//            itemCount: jinshi.length,
//            physics: NeverScrollableScrollPhysics(),
//            shrinkWrap: true,
//            itemBuilder: (BuildContext context, int index) {
//              return FlowEventRow(jinshi[index]);
//            },
//            separatorBuilder: (BuildContext context, int index) {
//              return Divider(
//                height: 1,
//                indent: 45,
//              );
//            },
//          ),
//        ],
//      ),
//    );
  }
}



@immutable
class FlowEventRow extends StatelessWidget {
  FlowEventRow(this.jinshi);

  JinshiModel jinshi;

  double get circleRadius => jinshi.title != null ? 8 : 6;

  Color get circleColor =>
      jinshi.title != null ? const Color(0xFF40BE7F) : const Color(0xFFD5D5D5);

  @override
  Widget build(BuildContext context) {
    final Color dimColor = const Color(0xFFC5C5C5);
    final Color highlightColor = const Color(0xFF40BE7F);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0 - circleRadius),
            child: Container(
              width: circleRadius * 2,
              height: circleRadius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '制单',
                          style: TextStyle(
                            fontSize: 13,
                            color:
                            jinshi.title != null ? highlightColor : dimColor,
                          ),
                        ),
                      ),
                      Text(
                        "123",
                        style: Theme
                            .of(context)
                            .textTheme
                            .caption
                            .copyWith(color: dimColor),
                      )
                    ],
                  ),
                  ...jinshi.title != null
                      ? [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      jinshi.title != null ?? '',
                      style: Theme
                          .of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 12),
                    )
                  ]
                      : [],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}