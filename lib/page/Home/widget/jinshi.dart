import 'dart:convert';

import 'package:butcher/common/dao/News_dao.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/widget_load_footer.dart';
import 'package:butcher/components/widget_load_header.dart';
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
  bool _loading = true;
  int currentStep = 0;
  EasyRefreshController _Controller;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  getData() {
    NewsDao.jinshi(page).then((res){
      DataJsonPage data = DataJsonPage.fromMap(res);
      print(jsonEncode(data.data.rows));
      if(data.code==100){
        data.data.rows.forEach((item){
          JinshiModel bean = JinshiModel.fromMap(item);
          jinshi.add(bean);
          //print(bean.title);
        });
        this._loading = false;
        if(data.data.rows.length<10){
          _Controller.finishLoad(noMore: true);
        }
        setState(() {

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
  void dispose() {
    // TODO: implement dispose
    _Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    return SingleChildScrollView(
//      child: jinshi.length > 0 ? Column(
//        children: <Widget>[
//          FlatButton(
//            child: Text('123'),
//            onPressed: () {
//              getData();
//            },
//          ),
//          Container(
//            child: Stepper(
//              currentStep: currentStep,
//              onStepTapped: (index) {
//                this.currentStep = index;
//                setState(() {
//                  currentStep=index;
//                });
//                print(index);
//              },
//              controlsBuilder: (BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel }) {
//                return Row(
//                  children: <Widget>[],
//                );
//              },
//              steps: jinshi.asMap().map((k,v) => MapEntry(k,Step(
//                title: Text('${DateTime.fromMillisecondsSinceEpoch(int.parse(v.createTime)).toString().substring(0,19)}'),
//                content: Text('${v.title}'),
//                subtitle: Container(
//                  child: Text('${v.title}'),
//                ),
//                isActive: true
//              ))
//              ).values.toList(),
////              steps: <Step>[
////                Step(
////                  title: Text('123'),
////                  content: Container(
////                    child: Text('456'),
////                    alignment: Alignment.centerLeft,
////                  ),
////                  subtitle: Container(
////                    child: Text('456'),
////                    alignment: Alignment.centerLeft,
////                  )
////                )
////              ],
//            ),
//          )
//        ],
//      ) : Container(),
//    );
    return LoadingContainer(
      isLoading: _loading,
      child: EasyRefresh(
        child: Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              // 左边的竖线
              Positioned(
                left: 21,
                top: 15,
                bottom: 15,
                child: VerticalDivider(
                  width: 1,
                ),
              ),
              // 右边的事件列表
              ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: jinshi.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return FlowEventRow(jinshi[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1,
                    indent: 45,
                  );
                },
              ),
            ],
          ),
        ),
        footer: LoadFooter(),
        header: LoadHeader(),
        onRefresh: () async {
          this.page=0;
          this.jinshi.clear();
          setState(() {
            page=page;
            jinshi=jinshi;
          });
          _Controller.finishLoad(noMore: false);
          getData();
        },
        controller: _Controller,
        onLoad: () async {
          this.page = this.page +1;
          print(this.page);
          setState(() {
            page=page;
          });
          getData();
        }
      ),
    );
  }
}


class FlowEventRow extends StatelessWidget with StyleBase {
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
                color: Colors.blue,
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
                          '${DateTime.fromMillisecondsSinceEpoch(int.parse(jinshi.createTime)).toString().substring(0,19)}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                          ),
                        ),
                      ),
//                      Text(
//                        "123",
//                        style: Theme
//                            .of(context)
//                            .textTheme
//                            .caption
//                            .copyWith(color: dimColor),
//                      )
                    ],
                  ),
                  SizedBox(
                      height: 4,
                  ),
                    Text(
                      jinshi.title,
                      style: TextStyle(color: Colors.blueGrey,fontSize: dw(AppConstant.minSize)),
                    )
//                  ...jinshi.title != null
//                      ? [
//                    SizedBox(
//                      height: 4,
//                    ),
//                    Text(
//                      jinshi.title != null ?? '',
//                      style: Theme
//                          .of(context)
//                          .textTheme
//                          .body1
//                          .copyWith(fontSize: 12),
//                    )
//                  ]
//                      : [],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}