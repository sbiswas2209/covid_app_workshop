import 'dart:convert';
import 'dart:async';

import 'package:covid_app/models/country.dart';
import 'package:covid_app/pages/countryTile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<List<Country>> fetchData(http.Client client) async {
    final response = await client.get('https://api.covid19api.com/countries');
    return compute(parseData, response.body);
  }

  List<Country> parseData(String response){
    final parsed = jsonDecode(response).cast<Map<String , dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
class CountryList extends StatelessWidget {
  static final String tag = 'country-list';
  //static final String urlCountry = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose country',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      body: FutureBuilder<List<Country>>(
        future: fetchData(http.Client()),
        builder: (context , snapshot){
          return !snapshot.hasData ? Center(child: CircularProgressIndicator(),):
            CountryListTile(countries: snapshot.data,);
        },
      ),
    );
  }
}