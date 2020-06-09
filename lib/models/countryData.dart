class CountryData{
  final int confirmed;
  final int recovered;
  final int deaths;

  CountryData({this.confirmed , this.recovered , this.deaths});

  factory CountryData.fromJsonGlobal(Map<String , dynamic> json){
    return CountryData(
      confirmed: json['TotalConfirmed'] as int,
      recovered: json['TotalRecovered'] as int,
      deaths: json['TotalDeaths'] as int,
    );
  }

  factory CountryData.fromJsonCountry(Map<String , dynamic> json){
    return CountryData(
      confirmed: json['Confirmed'] as int,
      recovered: json['Recovered'] as int,
      deaths: json['Deaths'] as int,
    );
  }

}