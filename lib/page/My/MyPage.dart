import 'dart:convert';

import 'package:butcher/common/dao/User_dao.dart';
import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/AButton/index.dart';
import 'package:butcher/components/custom_appbar.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/redux/login_redux.dart';
import 'package:butcher/redux/user_redux.dart';
import 'package:lottie/lottie.dart';

class MyPage extends StatefulWidget {
  static final String sName = "my";
  @override
  _MyPageState createState() => new _MyPageState();

}

class _MyPageState extends State<MyPage> with StyleBase {

  @override
  void dispose() {
    super.dispose();
    print("删除页面");
  }

  Widget barSearch() {
    return Container(
        child: new FlatButton(
            onPressed: (){
//              Navigator.of(context).push(new MaterialPageRoute(
//                  builder: (context) {
//                    return new SearchPage();
//                  }
//              ));
            },
            child: new Row(
              children: <Widget>[
                // new Container(
                //   child: new Icon(Icons.search, size: 18.0,),
                //   margin: const EdgeInsets.only(right: 26.0),
                // ),
                new Expanded(
                    child: new Container(
                      child: new Text("个人中心"),
                    )
                ),
                // new Container(
                //   child: new FlatButton(
                //     onPressed: (){},
                //     child: new Icon(Icons.settings_overscan, size: 18.0),
                //   ),
                //   width: 40.0,
                // ),
              ],
            )
        ),
        decoration: new BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            color: AppConstant.themeColor
        )
    );
  }

  Widget mineHead(){
    return StoreBuilder<BUTCHERState>(
        builder: (context, store) {
        if (store.state.userInfo != null) {
          return new FlatButton(
              onPressed: (){
                // NavigatorUtils.goLoginMethod(context);
              },
              child: new Container(
                child: ListTile(
                  leading: new Container(
                    child: new CircleAvatar(
                        backgroundImage: new NetworkImage("https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                        radius: 20.0
                    ),
                  ),
                  title: new Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    child: new Text(store.state.userInfo.username),
                  ),
                  subtitle: new Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: new Text("欢迎你"),
                  ),
                ),
              )
          );
        } else{
          return new FlatButton(
              onPressed: (){
                NavigatorUtils.goLoginMethod(context);
              },
              child: new Container(
                child: ListTile(
                  leading: new Container(
                    // child: Lottie.network('https://butcherhelp.oss-cn-beijing.aliyuncs.com/person.json',width: 30, height: 30),
                    child: new CircleAvatar(
                        backgroundImage: new NetworkImage("https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                        radius: 20.0
                    ),
                  ),
                  title: new Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    child: new Text("注册/登录"),
                  ),
                  subtitle: new Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: new Text("注册屠夫会员"),
                  ),
                ),
              )
          );
        }
    });
  }

  Widget myInfoCard() {
    return new Container(
      color: AppConstant.themeColor,
      margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
                color: AppConstant.dark == true ? Colors.white10 : new Color(0xFFF5F5F5),
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))
            ),
            child: mineHead(),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton (
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("0", style: new TextStyle(fontSize: 16.0, color: AppConstant.theme2Color),),
                            ),
                            new Container(
                              child: new Text("我的创作", style: new TextStyle(fontSize: 12.0, color: AppConstant.theme2Color),),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("0", style: new TextStyle(fontSize: 16.0, color: AppConstant.theme2Color),),
                            ),
                            new Container(
                              child: new Text("关注", style: new TextStyle(fontSize: 12.0, color: AppConstant.theme2Color),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("0", style: new TextStyle(fontSize: 16.0, color: AppConstant.theme2Color),),
                            ),
                            new Container(
                              child: new Text("我的收藏", style: new TextStyle(fontSize: 12.0, color: AppConstant.theme2Color),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(color: AppConstant.dark == true ?  Colors.white12 : Colors.black12, width: 1.0)
                      )
                  ),
                ),
                new Container(
                    width: (MediaQuery.of(context).size.width - 6.0) / 4,
                    child: new FlatButton(
                        onPressed: (){ToastUtils.showToast("功能暂未开放");},
                        padding: EdgeInsets.all(0),
                        child: new Container(
                          height: 50.0,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: new Text("0", style: new TextStyle(fontSize: 16.0, color: AppConstant.theme2Color),),
                              ),
                              new Container(
                                child: new Text("最近浏览", style: new TextStyle(fontSize: 12.0, color: AppConstant.theme2Color),),
                              )
                            ],
                          ),
                        )
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget myServiceCard() {
    return new Container(
      color: AppConstant.themeColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.book, color: Colors.white),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            new Container(
                              child: new Text("我的书架", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.flash_on, color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            new Container(
                              child: new Text("我的 Live", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.free_breakfast, color: Colors.white),
                                backgroundColor: new Color(0xFFA68F52),
                              ),
                            ),
                            new Container(
                              child: new Text("私家课", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.attach_money, color: Colors.white),
                                backgroundColor: new Color(0xFF355A9B),
                              ),
                            ),
                            new Container(
                              child: new Text("付费咨询", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.shop, color: Colors.white),
                                backgroundColor: new Color(0xFF088DB4),
                              ),
                            ),
                            new Container(
                              child: new Text("已购", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.radio, color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            new Container(
                              child: new Text("余额礼卷", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){ToastUtils.showToast("功能暂未开放");},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.wifi_tethering, color: Colors.white),
                                backgroundColor: new Color(0xFF029A3F),
                              ),
                            ),
                            new Container(
                              child: new Text("服务", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget settingCard() {
    return new Container(
      color: AppConstant.themeColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.invert_colors, color: Colors.white),
                          backgroundColor: new Color(0xFFB88800),
                        ),
                      ),
                      new Container(
                        child: new Text("社区建设", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.golf_course, color: Colors.white),
                          backgroundColor: new Color(0xFF63616D),
                        ),
                      ),
                      new Container(
                        child: new Text("反馈", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){
                  //AppConstant.themeColor = Colors.red;
                },
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(AppConstant.dark == true ? Icons.wb_sunny : Icons.brightness_2, color: Colors.white),
                          backgroundColor: new Color(0xFFB86A0D),
                        ),
                      ),
                      new Container(
                        child: new Text(AppConstant.dark == true ? "日间模式" : "夜间模式", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.perm_data_setting, color: Colors.white),
                          backgroundColor: new Color(0xFF636269),
                        ),
                      ),
                      new Container(
                        child: new Text("设置", style: new TextStyle(color: AppConstant.theme2Color, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget videoCard() {
    return new Container(
        color: AppConstant.themeColor,
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: new Column(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.videocam, color: Colors.white),
                        backgroundColor: new Color(0xFFB36905),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Text("视频创作", style: new TextStyle(fontSize: 18.0),),
                      ),
                    ),
                    new Container(
                      child: new FlatButton(
                          onPressed: (){},
                          child: new Text("拍一个", style: new TextStyle(color: Colors.blue),)
                      ),
                    )
                  ],
                )
            ),
            new Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        margin: const EdgeInsets.only(right: 6.0),
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration:new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage("https://pic2.zhimg.com/50/v2-5942a51e6b834f10074f8d50be5bbd4d_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration:new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage("https://pic3.zhimg.com/50/v2-7fc9a1572c6fc72a3dea0b73a9be36e7_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration:new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage("https://pic4.zhimg.com/50/v2-898f43a488b606061c877ac2a471e221_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                              ),
                            )
                        )
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: new AspectRatio(
                            aspectRatio: 4.0 / 2.0,
                            child: new Container(
                              foregroundDecoration:new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new NetworkImage("https://pic1.zhimg.com/50/v2-0008057d1ad2bd813aea4fc247959e63_400x224.jpg"),
                                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                              ),
                            )
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  Widget ideaCard() {
    return new Container(
        color: AppConstant.themeColor,
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: new Column(
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.all_inclusive, color: Colors.white),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Text("想法", style: new TextStyle(fontSize: 18.0),),
                      ),
                    ),
                    new Container(
                      child: new FlatButton(
                          onPressed: (){},
                          child: new Text("去往想法首页", style: new TextStyle(color: Colors.blue),)
                      ),
                    )
                  ],
                )
            ),
            new Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: AppConstant.theme2Color,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("苹果 WWDC 2018 正在举行", style: new TextStyle(color: AppConstant.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("软件更新意料之中，硬件之谜...", style: new TextStyle(color: AppConstant.theme2Color),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: AppConstant.theme2Color,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("此刻你的桌子是什么样子？", style: new TextStyle(color: AppConstant.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("晒一晒你的书桌/办公桌", style: new TextStyle(color: AppConstant.theme2Color),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic3.zhimg.com/v2-b4551f702970ff37709cdd7fd884de5e_294x245|adx4.png"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: AppConstant.theme2Color,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("关于高考你印象最深的是...", style: new TextStyle(color: AppConstant.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("聊聊你的高三生活", style: new TextStyle(color: AppConstant.theme2Color),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic2.zhimg.com/50/v2-ce2e01a047e4aba9bfabf8469cfd3e75_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 6.0),
                        decoration: new BoxDecoration(
                            color: AppConstant.theme2Color,
                            borderRadius: new BorderRadius.all(new Radius.circular(6.0))
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      child: new Text("夏天一定要吃的食物有哪些", style: new TextStyle(color: AppConstant.dark == true? Colors.white70 : Colors.black, fontSize: 16.0),),
                                    ),
                                  ),
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Container(
                                        margin: const EdgeInsets.only(top: 6.0),
                                        child: new Text("最适合夏天吃的那种", style: new TextStyle(color: AppConstant.theme2Color),),
                                      )
                                  )

                                ],
                              ),
                            ),
                            new Container(
                                margin: const EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width / 5,
                                child: new AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: new Container(
                                      foregroundDecoration:new BoxDecoration(
                                          image: new DecorationImage(
                                            image: new NetworkImage("https://pic1.zhimg.com/50/v2-bb3806c2ced60e5b7f38a0aa06b89511_400x224.jpg"),
                                            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                          ),
                                          borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<BUTCHERState>(
      builder: (context, store) {
      return Scaffold(
          appBar: new AppBar(
            title: barSearch(),
          ),
          drawer: Container(
            color: Colors.white,
            width: 300,
            child: Stack(
              children: <Widget>[
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Container(
                //       child: Container(
                //         padding: EdgeInsets.only(top: dh(60),bottom: 50),
                //         child: Text("设置",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                //       ),
                //     ),
                //   ],
                // ),
                Positioned(
                  bottom: 40,
                  right: dw(70),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 58,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                            onPressed: () async {
                              if(store.state.userInfo!=null){
                                final Action = await showDialog(
                                  context: context,
                                  barrierDismissible: false,//// user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('提示'),
                                      content: Text('你是否确认退出登录?'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('取消'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        FlatButton(
                                          child: Text('确认'),
                                          onPressed: () async {
                                            print(await LocalStorage.get(Config.TOKEN_KEY));
                                            UserDao.clearLogin(store.state.userInfo.userid).then((res) async {
                                              // DataJson data = DataJson.fromMap(res);
                                              print(jsonEncode(res));
                                              UserDao.clearAll(store);
                                              // store.dispatch(new UpdateUserAction(new UserBean()));
                                              StoreProvider.of<BUTCHERState>(context).state.userInfo = null;
                                              // store.dispatch(LoginAction(context, "account", new UserBean()));
                                              store.dispatch(new LogoutAction(context, false));
                                              ToastUtils.showToast('清除登录成功');
                                              Navigator.pop(context);
                                              setState(() {});
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }else{
                                Navigator.pop(context);
                                NavigatorUtils.goLogin(context);
                              }
                            },
                            child: store.state.userInfo!=null ? Container(
                              width: 200,
                              height: 88,
                              alignment: Alignment.center,
                              child: Text("退出登录",style: TextStyle(letterSpacing: 3,fontSize: 16, color: Colors.black),),
                            ) : Container(
                              width: 200,
                              height: 88,
                              alignment: Alignment.center,
                              child: Text("立即登录",style: TextStyle(letterSpacing: 3,fontSize: 16, color: Colors.black),),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppConstant.grayColor,width: dw(2)),
                            borderRadius: BorderRadius.circular(ds(44))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: new SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  myInfoCard(),
                  myServiceCard(),
                  // settingCard(),
                  // videoCard(),
                  // ideaCard()
                ],
              ),
            ),
          )
      );
    });
  }

}