import 'dart:convert';
import 'dart:ffi';

import 'package:butcher/common/dao/News_dao.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/widget_load_footer.dart';
import 'package:butcher/model/News/JinshiModel.dart';
import 'package:butcher/model/News/tradingModel.dart';
import 'package:butcher/model/result/DataJsonPage.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:butcher/page/Home/widget/tabComponents.dart';
import 'package:butcher/components/widget_load_header.dart';

class cryptocurrencies extends StatefulWidget {
  @override
  _cryptocurrenciesState createState() => _cryptocurrenciesState();
}

class _cryptocurrenciesState extends State<cryptocurrencies> with StyleBase,AutomaticKeepAliveClientMixin {

  List<TradingModel> tradingList = [];
  int page = 1;
  bool _loading = true;
  EasyRefreshController _Controller;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  getData() {
    NewsDao.getTradingNews(page, 3).then((res){
      DataJsonArray data = DataJsonArray.fromMap(res);
      if (data.msg == 'Success') {
        data.data.forEach((item){
          TradingModel bean = TradingModel.fromMap(item);
          tradingList.add(bean);
          //print(bean.title);
        });
        print(jsonEncode(tradingList));
        this._loading = false;
        if(data.data.length < 10){
          _Controller.finishLoad(noMore: true);
        }
        if (mounted) {
          setState(() {
            tradingList=tradingList;
            _loading=_loading;
          });
        }
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
                  itemCount: tradingList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TabComponents(tradingList[index]);
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
          header: LoadHeader(),
          footer: LoadFooter(),
          onRefresh: () async {
            this.page = 1;
            this.tradingList.clear();
            setState(() {
              page=page;
              tradingList=tradingList;
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
