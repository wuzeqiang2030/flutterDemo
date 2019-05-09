
import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget{
  @override
  _MinePageState createState() =>_MinePageState();

}

class _MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text(
          'MinePage',
          style: new TextStyle(fontSize: 18)),
    );
  }

}