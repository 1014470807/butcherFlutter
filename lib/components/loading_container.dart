import 'package:flutter/material.dart';
import 'package:butcher/common/public/public.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///加载进度条组件
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer(
      {Key key,
        @required this.isLoading,
        this.cover = false,
        @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView
        : Stack(
      children: <Widget>[child, isLoading ? _loadingView : Container()],
    );
  }

  Widget get _loadingView {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(bottom: 20),
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 40,
        ),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }
}