import 'dart:math' as Math;
import 'package:butcher/common/public/public.dart';
import 'package:flutter/services.dart';

class CountdownInit extends StatefulWidget {
  CountdownInit({Key key}) : super(key: key);

  @override
  _CountdownInit createState() => _CountdownInit();
}

class _CountdownInit extends State<CountdownInit> with StyleBase, SingleTickerProviderStateMixin {
  Animation<double> _animation;         // canvas转动动画函数
  AnimationController _controller;      // canvas转动动画控制器
  int _time = 5;                        // 首页载入秒数

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    // SystemChrome.setEnabledSystemUIOverlays([]);

    _controller = AnimationController(duration: Duration(seconds: _time), vsync: this,);  // 倒计时动画控制器
    _animation = Tween(begin: 0.0, end: 360.0).animate(_controller);
    _controller.addListener(() {
      if (mounted)
        setState(() {});
    });
    _controller.addStatusListener((AnimationStatus a) {
      if (a == AnimationStatus.completed) {
        _jumpIndex();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _jumpIndex() {
//    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
//      NavigatorUtils.goIndex(context);
//    })
  //print("shu");
    NavigatorUtils.goIndex(context);
    //Navigator.of(context).pushReplacementNamed('/index');
    /* Future.delayed(Duration(milliseconds: 300), () {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    }); */
  }

  @override
  Widget build(BuildContext context) {
    var countNum = _time - (_animation.value * 5 / 360).round();
    return GestureDetector(
      onTap: _jumpIndex,
      child: Container(
        width: dw(50),
        height: dw(50),
        decoration: ShapeDecoration(
          color: Color.fromARGB(70, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(dw(50)),
            ),
          ),
        ),
        child: CustomPaint(
          child: Center(
            child: Text(
              '${countNum}s',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          painter: CircleProgressBarPainter(_animation.value),
        ),
      ),
    );
  }

}

// canvas画布绘制加载倒计时
class CircleProgressBarPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final rate;

  CircleProgressBarPainter(this.rate) {
    _paintBackground = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    /* canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground); */
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0.0, rate * Math.pi / 180, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}