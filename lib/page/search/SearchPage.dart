import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 var editingcontroller1 = TextEditingController();
//  SearchListPage _searchListPage;

  void changeContent() {
    setState(() {
//      _searchListPage = new SearchListPage(new ValueKey(controller.text));
    });
  }

  @override
  void initState() {
    super.initState();
    changeContent();
  }


  TextField searchField = new TextField(
    autofocus: true,
    textInputAction: TextInputAction.search,
    onSubmitted: (content) {
//      changeContent();
    },
    decoration: new InputDecoration(
      border: InputBorder.none,
      hintText: '搜一搜，没有数据的哦',
      hintStyle: TextStyle(color: Colors.white24),
    ),
//    controller: editingcontroller1,
    style: TextStyle(color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: searchField, actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              changeContent();
            }),
        new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              setState(() {
                editingcontroller1.clear();
              });
            }),
      ]),
      //TODO 列表
//      body: _searchListPage,
    );
  }
}
