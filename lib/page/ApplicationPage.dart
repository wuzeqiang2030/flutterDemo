
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/GlobalConfig.dart';
import 'package:flutter_app/page/classify/ClassifyPage.dart';
import 'package:flutter_app/page/home/HomePage.dart';
import 'package:flutter_app/page/mine/MinePage.dart';

class ApplicationPage extends StatefulWidget{

  @override
  _ApplicationPageAtate createState() => _ApplicationPageAtate();

}
class _ApplicationPageAtate extends State<ApplicationPage>{

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

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(primaryColor: GlobalConfig.colorPrimaryDark),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[ClassifyPage(),HomePage(), MinePage()],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: _bottomTabs,
            currentIndex: page,
            fixedColor: GlobalConfig.colorButtonText,
            type: BottomNavigationBarType.fixed,
            onTap: onTap
        ),
      ),
    );
  }

  void onTap(int value) {
    pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

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
