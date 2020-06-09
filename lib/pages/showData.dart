import 'package:covid_app/models/countryData.dart';
import 'package:flutter/material.dart';
class ShowData extends StatelessWidget {
  final List<CountryData> data;
  final String iso;
  ShowData({this.data , this.iso});
  @override
  Widget build(BuildContext context) {
    try{
      return Card(
            color: Theme.of(context).primaryColorLight,
            child: ListView(
              children: <Widget>[
                Image(image: NetworkImage('https://www.countryflags.io/${this.iso}/shiny/64.png'),),
                SizedBox(height:5),
                Center(
                  child: Text('Confirmed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Center(
                  child: Text('${data[(data.length-1)].confirmed}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Center(
                  child: Text('Recovered',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${data[(data.length-1)].recovered}',
                      style: TextStyle(
                        color: (data[(data.length-1)].recovered - data[(data.length-2)].recovered) > 0?
                          Colors.green[800] : Colors.red[800], 
                        fontSize: 20.0,
                      ),
                    ),
                SizedBox(width:5),
                Icon(Icons.arrow_drop_up ,
                  color: (data[(data.length-1)].recovered - data[(data.length-2)].recovered) > 0?
                        Colors.green[800] : Colors.red[800],
                ),
                  ],
                ),
                Center(
                  child: Text('Deaths',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${data[(data.length-1)].deaths}',
                      style: TextStyle(
                        color: (data[(data.length-1)].deaths - data[(data.length-2)].deaths) < 0?
                          Colors.green[800] : Colors.red[800], 
                        fontSize: 20.0,
                      ),
                    ),
                SizedBox(width:5),
                Icon(Icons.arrow_drop_up ,
                  color: (data[(data.length-1)].deaths - data[(data.length-2)].deaths) < 0?
                        Colors.green[800] : Colors.red[800],
                ),
                  ],
                ),
              ],
            ),
          );
    }
    catch(e){
      return Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/images/error.gif')),
            SizedBox(height:10),
            Text('Sorry but the relevant data of this country could not be found.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      );
    }
  }
}