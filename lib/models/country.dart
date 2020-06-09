class Country{
  final String name;
  final String slug;
  final String iso;
  
  Country({this.name , this.slug , this.iso});

  factory Country.fromJson(Map<String , dynamic> json){
    return Country(
      name: json['Country'] as String,
      slug: json['Slug'] as String,
      iso: json['ISO2'] as String,
    );
  }

}