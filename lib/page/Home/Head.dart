import 'package:butcher/common/public/public.dart';
import 'dart:ui';

class DyHeader extends StatefulWidget {
  final num height;
  final num opacity;
  final BoxDecoration decoration;
  final bool gray;
  DyHeader({ this.height, this.opacity = 1.0, this.decoration, this.gray = false });

  @override
  _DyHeader createState() => _DyHeader();
}

class _DyHeader extends State<DyHeader> with StyleBase {
  TextEditingController _search = TextEditingController();

  Future _scan() async {
//    try {
//      _search.text = await BarcodeScanner.scan();
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        DYdialog.alert(context, text: '设备未获得权限');
//      } else {
//        DYdialog.alert(context, text: '未捕获的错误: $e');
//      }
//    } on FormatException {  // 用户手动点击设备返回
//
//    } catch (e) {
//      DYdialog.alert(context, text: '未捕获的错误: $e');
//    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height != null ? widget.height : MediaQueryData.fromWindow(window).padding.top + dw(55),
      width: screenWidth,
      decoration: widget.decoration != null ? widget.decoration : BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xffff8633),
            Color(0xffff6634),
          ],
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            bottom: dw(10),
            child: Opacity(
              opacity: widget.opacity,
              child: SizedBox(
                width: screenWidth - dw(30),
                height: dw(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(dw(20)),
                      ),
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Image.asset(
                          'static/images/default-avatar.webp',
                          width: dw(40),
                          height: dw(40),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: dw(35),
                        margin: EdgeInsets.only(left: dw(15)),
                        padding: EdgeInsets.only(left: dw(5), right: dw(5)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(dw(35 / 2)),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            // 搜索ICON
                            Image.asset(
                              'static/images/search.webp',
                              width: dw(25),
                              height: dw(15),
                            ),
                            // 搜索输入框
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _search,
                                cursorColor: AppConstant.themeColor,
                                cursorWidth: 1.5,
                                style: TextStyle(
                                  color: AppConstant.themeColor,
                                  fontSize: 14.0,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintText: '金咕咕doinb',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _scan,
                              child: Image.asset(
                                'static/images/camera.webp',
                                width: dw(20),
                                height: dw(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dw(10)),
                      child: Image.asset(
                        widget.gray ? 'static/images/history-gray.webp' : 'static/images/history.webp',
                        width: dw(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dw(10)),
                      child: Image.asset(
                        widget.gray ? 'static/images/game-gray.webp' : 'static/images/game.webp',
                        width: dw(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dw(10)),
                      child: Image.asset(
                        widget.gray ? 'static/images/chat-gray.webp' : 'static/images/chat.webp',
                        width: dw(25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}