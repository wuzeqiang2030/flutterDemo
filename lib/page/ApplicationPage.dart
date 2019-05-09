
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/GlobalConfig.dart';
import 'package:flutter_app/page/classify/ClassifyPage.dart';
import 'package:flutter_app/page/home/HomePage.dart';
import 'package:flutter_app/page/index/IndexDrawPage.dart';
import 'package:flutter_app/page/mine/MinePage.dart';
import 'package:oktoast/oktoast.dart';

class ApplicationPage extends StatefulWidget{

  @override
  _ApplicationPageAtate createState() => _ApplicationPageAtate();

}
///写入底部导航 BottomNavigationBar
class _ApplicationPageAtate extends State<ApplicationPage> {

  int page = 1;
  String title = GlobalConfig.homeTab;
  PageController pageController;


  //定义底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: Icon(Icons.tune),
        title: Text(GlobalConfig.classyTab,
            style: TextStyle(fontSize: GlobalConfig.BottomBarTextSize)),
        backgroundColor: GlobalConfig.colorButtonText),
    new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(GlobalConfig.homeTab,
            style: TextStyle(fontSize: GlobalConfig.BottomBarTextSize)),
        backgroundColor: GlobalConfig.colorButtonText),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(GlobalConfig.mineTab,
            style: TextStyle(fontSize: GlobalConfig.BottomBarTextSize)),
        backgroundColor: GlobalConfig.colorButtonText),
  ];

  //State 中启动周期
  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  //State 中关闭周期
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int _lastClickTime = 0 ;

  @override
  Widget build(BuildContext context) {
    // MaterialApp  APP创建
    return WillPopScope(
      onWillPop: ()async{
        int nowTime = new DateTime.now().microsecondsSinceEpoch;
        if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
          return new Future.value(false);;
        }else{
          _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
          new Future.delayed(const Duration(milliseconds: 1500), () {
            _lastClickTime = 0;
          });
          return new Future.value(true);
        }
      },
      child: MaterialApp(
        theme: new ThemeData(primaryColor: GlobalConfig.colorPrimaryDark),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          drawer: new Drawer(
            child: new IndexDrawPage(
              email: GlobalConfig.email,
              name: GlobalConfig.authorNice,
              profileimg: "assets/image/profile_2.jpg",
              background: "assets/image/bg_2.jpg",
            ),
          ),
          body: new PageView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[ClassifyPage(), HomePage(), MinePage()],
            controller: pageController,
            onPageChanged: onPageChanged,
          ),

          ///bottomNavigationBar 是一个 Widget
          bottomNavigationBar: new BottomNavigationBar(
              items: _bottomTabs,
              currentIndex: page,
              fixedColor: GlobalConfig.colorButtonText,
              type: BottomNavigationBarType.fixed,
              onTap: onTap
          ),
        ),
      ),
    );
  }

  void onTap(int value) {
    pageController.animateToPage(
        value, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  //setState 当前Page页
  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = GlobalConfig.classyTab;
          break;
        case 1:
          title = GlobalConfig.homeTab;
          break;
        case 2:
          title = GlobalConfig.mineTab;
          break;
      }
    });
  }




}
