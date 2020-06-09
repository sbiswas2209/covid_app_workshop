import 'package:covid_app/models/country.dart';
import 'package:covid_app/pages/countryStats.dart';
import 'package:flutter/material.dart';
class CountryListTile extends StatelessWidget {
  final List<Country> countries;
  CountryListTile({Key key , this.countries}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).primaryColorLight,
            child: ListTile(
              leading: Image(image: NetworkImage('https://www.countryflags.io/${countries[index].iso}/shiny/64.png')),
              title: Text('${countries[index].name}',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              onTap: () => Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new CountryStatistics(country: this.countries[index],),
              )),
            ),
          ),
        );
      },
    );
  }
}