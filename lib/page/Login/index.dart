import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/AButton/index.dart';
import 'package:butcher/components/custom_appbar.dart';

class LoginMethod extends StatelessWidget with StyleBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppConstant.themeColor,
        child: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: dw(100),top: dw(100)),
              width: dw(220),
              height: dw(220),
              child: Image.asset('static/images/logo.jpg', fit: BoxFit.cover,),
            ),
            Container(
              child: AButton.normal(
                width: dw(450),
                child: Text('注册'),
                color: hex('#fff'),
                bgColor: Colors.blue,
                onPressed: (){
                  NavigatorUtils.goExperience(context);
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: AButton.normal(
                  width: dw(450),
                  child: Text('登录'),
                  color: rgba(136, 175, 213, 1),
                  bgColor: hex('#fff'),
                  borderColor: rgba(136, 175, 213, 1),
                  plain: true,
                  onPressed: () {
                    NavigatorUtils.goLogin(context);
                  }
              ),
            ),
          ],),
        ),
      ),
    );
  }
}


