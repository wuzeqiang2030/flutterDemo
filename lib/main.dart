
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/GlobalConfig.dart';
import 'package:flutter_app/page/ApplicationPage.dart';
import 'package:flutter_app/widget/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //主入口
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '初建Flutter',
      theme: new ThemeData(
        primarySwatch: GlobalConfig.colorPrimaryDark,
      ),
      home: new ApplicationPage(),
    );
  }

}
