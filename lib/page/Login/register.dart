import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/AButton/index.dart';
import 'package:butcher/components/custom_appbar.dart';
import 'package:butcher/model/User/User.dart';
import 'package:butcher/redux/login_redux.dart';
import 'package:color_dart/color_dart.dart';
import 'package:butcher/page/Index/index.dart';
import 'package:butcher/common/dao/User_dao.dart';
import 'package:common_utils/common_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class Register extends StatefulWidget {
  final int experience;
  Register(this.experience);
  @override
  _RegisterState createState() => _RegisterState(this.experience);
}

class _RegisterState extends State<Register> with StyleBase {
  final TextEditingController accountController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final int experience;
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  bool _loading = false;
  _RegisterState(this.experience);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    accountController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context: context, borderBottom: false),
      body: LoadingContainer(
        isLoading: _loading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: KeyboardAvoider(
              autoScroll: true,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 87),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        child: Lottie.asset('static/json/login.json',width: 220, height: 220),
                      ),

                      /// 输入手机
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        decoration: BoxDecoration(
                          border: AppConstant.borderBottom(),
                          color: AppConstant.themeColor,
                        ),
                        child: TextField(
                          focusNode: userFocus,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: ds(26),color: AppConstant.theme2Color),
                          controller: accountController,
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(dw(0)),
                            labelText: '账号',
                            labelStyle: TextStyle(fontSize: ds(30),color: AppConstant.theme2Color),
                            border: InputBorder.none,
                            hintText: '请输入你的账户(不能中文)',
                            hintStyle: TextStyle(fontSize: ds(20),color: AppConstant.theme2Color),
                          ),
                          onChanged: (e) {
                            RegExp regExp = RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+");
                            setState(() {

                            });
                          },
                        ),
                      ),

                      /// 密码
                      Container(
                        margin: EdgeInsets.only(bottom: dw(100)),
                        decoration: BoxDecoration(
                            border: AppConstant.borderBottom()
                        ),
                        child: TextField(
                          focusNode: passFocus,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          style: TextStyle(fontSize: ds(26),color: AppConstant.theme2Color),
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.all(dw(0)),
                            labelText: '密码',
                            labelStyle: TextStyle(fontSize: ds(30),color: AppConstant.theme2Color),
                            border: InputBorder.none,
                            hintText: '请输入你的密码',
                            hintStyle: TextStyle(fontSize: ds(20),color: AppConstant.theme2Color),
                          ),
                          onChanged: (e) {
                            RegExp regExp = RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+");
                            setState(() {

                            });
                          },
                          onSubmitted: (text) {
                            print('submit $text');
                          },
                        ),
                      ),
                      /// 确认
                      Container(
                        margin: EdgeInsets.only(top: dw(20)),
                        child: AButton.normal(
                            width: 300,
                            child: Text('注册'),
                            bgColor: rgba(136, 175, 213, 1),
                            color: hex('#fff'),
                            onPressed: ()  async {
                              userFocus.unfocus();
                              passFocus.unfocus();
                              Future.delayed(const Duration(milliseconds: 500), () {
                                RegExp passReg = RegExp(RegexUtil.regexUsername2);
                                RegExp qqReg = RegExp('[0-9a-zA-Z]{4,}');
                                if (!qqReg.hasMatch(accountController.text)) {
                                  ToastUtils.showToast('用户名最少5长度');
                                  return false;
                                }
                                if (!passReg.hasMatch(passwordController.text)) {
                                  ToastUtils.showToast('密码6-18位,包含字符和数字');
                                  return false;
                                }
                                setState(() {
                                  _loading=true;
                                });
                                if(accountController.text!='' && passwordController.text!=''){
                                  UserDao.register(accountController.text, passwordController.text,this.experience).then((res) async {
                                    //print(jsonEncode(res));
                                    User data = User.fromMap(res);
                                    //print(data);
                                    if(data.code==100){
                                      setState(() {
                                        _loading=false;
                                      });
                                      ToastUtils.showToast("注册成功");
                                      StoreProvider.of<BUTCHERState>(context).dispatch(LoginAction(context, "account", data.data));
                                    }else{
                                      setState(() {
                                        _loading=false;
                                      });
                                      ToastUtils.showToast("注册失败");
                                    }
                                  });
                                }
                              });
                            }
                        ),
                      ),

                      /// 协议
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: <Widget>[
                            Text('点击确定，即表示以阅读并同意', style: TextStyle(
                                fontSize: dw(20),
                                color: rgba(153, 153, 153, 1)
                            ),),
                            InkWell(
                              child: Text('《隐私政策》', style: TextStyle(
                                  color: Color.fromRGBO(85, 122, 157, 1),
                                  fontSize: dw(20)
                              ),),
                              onTap: () {
                                NavigatorUtils.goWebview(context, 'https://app.butcherhelp.cn/book/', '隐私政策');
                              },
                            )
                          ],),
                      )
                    ],),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}