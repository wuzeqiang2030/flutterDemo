

import 'package:flutter/widgets.dart';

routePageBuilder(BuildContext context,String text){

  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder:  (BuildContext context, _, __) {

      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}



routePagerNavigator(BuildContext context, Widget v) {

  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return v;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}
