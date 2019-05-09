
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/DialogUtils.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  CurvedAnimation curved; //曲线动画，动画插值，
  AnimationController controller; //动画控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync:  this, duration: const Duration(seconds: 1));
    curved = new CurvedAnimation(
        parent: controller, curve: Curves.bounceOut); //模仿小球自由落体运动轨迹
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:new AppBar(
        title: new Text('历史车轮'),
        actions: <Widget>[
          new RotationTransition(
            turns: curved,
            child: new IconButton(
                icon: new Icon(Icons.autorenew),
                onPressed: () {
                  controller.forward(); //向前播放动画
                  ///这里添加刷新功能
                  DialogUtils.show(context, "更新中…");
//                  requestHistoryData();
                }),
          )
        ],
      )
    );
  }
}