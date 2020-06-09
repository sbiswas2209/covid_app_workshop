import 'package:covid_app/pages/liveMap.dart';
import 'package:covid_app/pages/statistics.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  static final String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Covid-19 Stats',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            color: Theme.of(context).primaryColorLight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Most people who fall sick with COVID-19 will experience mild to moderate symptoms and recover without special treatment.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                          child: Card(
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Image(
                              image: AssetImage('assets/images/statistics.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Statistics',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                       ],
                     ),
                   ),
                   onTap: () => Navigator.push(context, new MaterialPageRoute(
                     builder: (BuildContext context) => new StatisticsPage(),
                   )),
            ),
            ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                          child: Card(
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Image(
                              image: AssetImage('assets/images/maps.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Live Map',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                       ],
                     ),
                   ),
                   onTap: () => Navigator.push(context, new MaterialPageRoute(
                     builder: (BuildContext context) => new LiveMap(),
                   )),
            ),
            ),
        ],
      ),
    );
  }
}