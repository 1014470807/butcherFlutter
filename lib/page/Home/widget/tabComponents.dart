import 'dart:convert';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/model/News/tradingModel.dart';

class TabComponents extends StatelessWidget with StyleBase {
  TabComponents(this.trading);

  TradingModel trading;

  double get circleRadius => trading.title != null ? 8 : 6;

  Color get circleColor =>
      trading.title != null ? const Color(0xFF40BE7F) : const Color(0xFFD5D5D5);

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
                          '${DateTime.fromMillisecondsSinceEpoch(int.parse(trading.time)).toString().substring(0,19)}',
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
                    trading.title,
                    style: TextStyle(color: Colors.white,fontSize: dw(AppConstant.minSize), fontWeight: FontWeight.w400),
                  ),
                  trading.img != '' ? Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Image.network(trading.img)
                    ],
                  ) : Container(),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    trading.desc,
                    style: TextStyle(color: Colors.blueGrey,fontSize: dw(AppConstant.minSize)),
                  )
//                  ...trading.title != null
//                      ? [
//                    SizedBox(
//                      height: 4,
//                    ),
//                    Text(
//                      trading.title != null ?? '',
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