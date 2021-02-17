import 'dart:convert';
import 'dart:ffi';

import 'package:butcher/common/dao/News_dao.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/widget_load_footer.dart';
import 'package:butcher/model/News/JinshiModel.dart';
import 'package:butcher/model/News/stockModel.dart';
import 'package:butcher/model/result/DataJsonPage.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:butcher/components/widget_load_header.dart';

class stockToday extends StatefulWidget {
  @override
  _stockTodayState createState() => _stockTodayState();
}

class _stockTodayState extends State<stockToday> with StyleBase,AutomaticKeepAliveClientMixin {

  List<StockModel> stockList = [];
  int page = 1;
  bool _loading = true;
  EasyRefreshController _Controller;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _Controller = EasyRefreshController();
    this.getData();
  }

  getData() {
    NewsDao.getTodayAll(page).then((res){
      DataJsonArray data = DataJsonArray.fromMap(res);
      if (data.msg == 'Success') {
        data.data.forEach((item){
          StockModel bean = StockModel.fromJson(item);
          stockList.add(bean);
          //print(bean.title);
        });
        print(jsonEncode(stockList));
        this._loading = false;
        if(data.data.length < 20){
          _Controller.finishLoad(noMore: true);
        }
        if (mounted) {
          setState(() {
            stockList=stockList;
            _loading=_loading;
          });
        }
      }
    });
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
    return LoadingContainer(
      isLoading: _loading,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('股票编号'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('股票名称'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('价格'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('涨跌幅'),
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: EasyRefresh(
                child: Column(
                  children: stockList.asMap().map((k,v)=>
                      MapEntry(k, Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(v.code),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(v.name),
                                )
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(NumUtil.getNumByValueDouble(double.parse(v.trade), 2).toStringAsFixed(2))
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(NumUtil.getNumByValueDouble(double.parse(v.changepercent.toString()), 2).toStringAsFixed(2) + '%', style: double.parse(v.changepercent.toString()) > 0 ? TextStyle(color: Color.fromRGBO(233, 48, 48, 1)) : TextStyle(color: Color.fromRGBO(48, 102, 18, 1)))
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  ).values.toList(),
                ),
                header: LoadHeader(),
                footer: LoadFooter(),
                onRefresh: () async {
                  this.page = 1;
                  this.stockList.clear();
                  setState(() {
                    page=page;
                    stockList=stockList;
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
            )
          )
        ],
      ),
    );
  }
}
