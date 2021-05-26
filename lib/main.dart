import 'package:flutter_application_widget/pages/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_widget/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getRoutes(),
        onGenerateRoute: (RouteSettings setting) {
          return MaterialPageRoute(
              builder: (BuildContext context) => AlertPage());
        });
  }
}
