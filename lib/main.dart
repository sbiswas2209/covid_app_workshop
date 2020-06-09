import 'package:covid_app/pages/country_list.dart';
import 'package:covid_app/pages/globalData.dart';
import 'package:covid_app/pages/home.dart';
import 'package:covid_app/pages/liveMap.dart';
import 'package:covid_app/pages/statistics.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String,WidgetBuilder>{
    HomePage.tag : (context) => new HomePage(),
    LiveMap.tag : (context) => new LiveMap(),
    StatisticsPage.tag : (context) => new StatisticsPage(),
    CountryList.tag : (context) => new CountryList(),
    GlobalData.tag : (context) => new GlobalData(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: routes,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.amber,
        primaryColorLight: Colors.grey[300],
      ),
    );
  }
}