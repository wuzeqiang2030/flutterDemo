
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/commom/GlobalConfig.dart';
import 'package:flutter_app/page/history/HistoryPage.dart';
import 'package:flutter_app/page/search/SearchPage.dart';
import 'package:flutter_app/utils/PageRouteUtils.dart';
import 'package:flutter_app/widget/diment.dart';

/**
 * 侧滑栏 路由页
 */
class IndexDrawPage extends StatelessWidget{
  String email, name, profileimg, background;

  IndexDrawPage({this.background, this.profileimg, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new ListView(
      children: <Widget>[
        ///侧换栏中头像和用户名背景
        new UserAccountsDrawerHeader(
          accountName: new Text(name),
          accountEmail: new Text(email),
          currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(profileimg),),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(background), fit: BoxFit.cover)),
        ),

        ///侧换栏中文本list
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(
                  GlobalConfig.drawList1,
                  style: new TextStyle(
                      fontSize: drawTextSize),),
                trailing: new Icon(
                  Icons.whatshot,
                  color: Colors.blue,
                ),
                onTap: () {
                  print("Home");
                  Navigator.of(context).pop();
                  routePageBuilder(context, GlobalConfig.welfare);
                },
              ),
              Divider(
                height: 1,
                color: Colors.black12,
              ),

              new ListTile(
                title: new Text(GlobalConfig.drawList2,
                  style: new TextStyle(
                      fontSize: drawTextSize),),
                trailing: new Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onTap: () {
                  print("Notification");
                  Navigator.of(context).pop();
                  routePagerNavigator(context, new SearchPage());
                },
              ),
              Divider(
                height: 1,
                color: Colors.black12,
              ),
              new ListTile(
                title: new Text(GlobalConfig.drawList3,
                  style: new TextStyle(
                      fontSize: drawTextSize),),
                trailing: new Icon(
                  Icons.history,
                  color: Colors.blue,
                ),
                onTap: () {
                  print("Notification");
                  Navigator.of(context).pop();
                  routePagerNavigator(context, new HistoryPage());
                },
              ),
              Divider(
                height: 1,
                color: Colors.black12,
              ),
              new ListTile(
                title: new Text(GlobalConfig.drawList4,
                  style: new TextStyle(
                      fontSize: drawTextSize),),
                trailing: new Icon(
                  Icons.exit_to_app,
                  color: Colors.blue,),
                onTap: () {
                  print("Exit");
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ],
    );
  }

}