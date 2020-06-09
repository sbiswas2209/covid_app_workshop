import 'dart:convert';
import 'dart:async';
import 'package:covid_app/models/country.dart';
import 'package:covid_app/models/countryData.dart';
import 'package:covid_app/pages/showData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CountryStatistics extends StatefulWidget {
  final Country country;
  CountryStatistics({this.country});
  @override
  _CountryStatisticsState createState() => _CountryStatisticsState(country: this.country);
}

Future<List<CountryData>> fetchData(http.Client client , Country country) async {
  final response = await client.get('https://api.covid19api.com/live/country/${country.slug}');
  return compute(parseData , response.body);
}

List<CountryData> parseData(String response){
  final parsed = jsonDecode(response).cast<Map<String , dynamic>>();
  return parsed.map<CountryData>((json) => CountryData.fromJsonCountry(json)).toList();
}

class _CountryStatisticsState extends State<CountryStatistics> {
  final Country country;
  _CountryStatisticsState({this.country});
  Future<List<CountryData>> data;
  @override
  void initState(){
    super.initState();
    data = fetchData(http.Client() , this.country);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
                  child: Text('${country.name} Statistics',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.home),
            onPressed: (){
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 3;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: data,
        builder: (context , snapshot){
          return !snapshot.hasData ? Center(child: CircularProgressIndicator(),):
          ShowData(data: snapshot.data , iso: country.iso);
        },
      ),
    );
  }
}