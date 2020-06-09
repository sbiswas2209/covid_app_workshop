import 'package:covid_app/pages/country_list.dart';
import 'package:covid_app/pages/globalData.dart';
import 'package:flutter/material.dart';
class StatisticsPage extends StatelessWidget {
  static final String tag = 'statistics-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                          child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/world.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('World Data',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new GlobalData(),
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
                      image: AssetImage('assets/images/country.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Country-Wise Data',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new CountryList(),
              )),
            ),
          ),
        ],
      ),
    );
  }
}