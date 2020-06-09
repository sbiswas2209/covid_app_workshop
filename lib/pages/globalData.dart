import 'dart:async';
import 'dart:convert';
import 'package:covid_app/models/countryData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GlobalData extends StatefulWidget {
  static final String tag = 'global-data';
  @override
  _GlobalDataState createState() => _GlobalDataState();
}
Future<CountryData> fetchData() async {
    final response = await http.get('https://api.covid19api.com/world/total');
    if(response.statusCode == 200){
      return CountryData.fromJsonGlobal(json.decode(response.body));
    }
    else{
      throw Exception('Error while loading page.');
    }
}
class _GlobalDataState extends State<GlobalData> {
  Future<CountryData> futureData;
  @override
  void initState(){
    super.initState();
    futureData = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Data',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
          body: FutureBuilder(
        future: futureData,
        builder: (context , snapshot){
          return !snapshot.hasData ? Center(child: CircularProgressIndicator()):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/world.png'),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('Confirmed',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('${snapshot.data.confirmed}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('Recovered',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('${snapshot.data.recovered}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('Deaths',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height:5),
                      Center(
                        child: Text('${snapshot.data.deaths}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}