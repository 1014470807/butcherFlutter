import 'package:butcher/common/public/public.dart';
import 'package:butcher/components/custom_appbar.dart';
import 'package:butcher/components/AButton/index.dart';

class experience extends StatefulWidget {
  @override
  _experienceState createState() => _experienceState();
}

class _experienceState extends State<experience> with StyleBase {
  int _selectType = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: dw(600),
                margin: EdgeInsets.only(bottom: dw(180),top: dw(400)),
                decoration: BoxDecoration(
                    border: AppConstant.borderBottom()
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: [
                        new DropdownMenuItem(
                          child: new Text('1年以下'),
                          value: 1,
                        ),
                        new DropdownMenuItem(
                          child: new Text('1-3年'),
                          value: 2,
                        ),
                        new DropdownMenuItem(
                          child: new Text('3-5年'),
                          value: 3,
                        ),
                        new DropdownMenuItem(
                          child: new Text('5年以上'),
                          value: 4,
                        )
                      ],
                      hint: new Text('请选择'),
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _selectType = value;
                        });
                      },
                      elevation: 24,//设置阴影的高度
                      style: new TextStyle(//设置文本框里面文字的样式
                        color: Colors.blue,
                        fontSize: dw(24),
                      ),
                      value: _selectType,
                    )
                ),
              ),
              Container(
                child: AButton.normal(
                    width: dw(450),
                    child: Text('注册'),
                    color: hex('#fff'),
                    bgColor: Colors.blue,
                    onPressed: (){
                      NavigatorUtils.goRegister(context,this._selectType);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
