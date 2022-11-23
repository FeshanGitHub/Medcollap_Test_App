import 'dart:convert';

CountryDetailResponse countryDetailResponseFromJson(String str) => CountryDetailResponse.fromJson(json.decode(str));

String countryDetailResponseToJson(CountryDetailResponse data) => json.encode(data.toJson());

class CountryDetailResponse {
  CountryDetailResponse({
    required this.geonames,
  });

  Geonames geonames;

  factory CountryDetailResponse.fromJson(Map<String, dynamic> json) => CountryDetailResponse(
    geonames: Geonames.fromJson(json["geonames"]),
  );

  Map<String, dynamic> toJson() => {
    "geonames": geonames.toJson(),
  };
}

class Geonames {
  Geonames({
    required this.country,
  });

  Country country;

  factory Geonames.fromJson(Map<String, dynamic> json) => Geonames(
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "country": country.toJson(),
  };
}

class Country {
  Country({
  required this.countryCode,
  required this.countryName,
  required this.isoNumeric,
  required this.isoAlpha3,
  required this.fipsCode,
  required this.continent,
  required this.continentName,
  required this.capital,
  required this.areaInSqKm,
  required this.population,
  required this.currencyCode,
  required this.languages,
  required this.geonameId,
  required this.west,
  required this.north,
  required this.east,
  required this.south,
  required this.postalCodeFormat,
  });

  String countryCode;
  String countryName;
  int isoNumeric;
  String isoAlpha3;
  String fipsCode;
  String continent;
  String continentName;
  String capital;
  int areaInSqKm;
  int population;
  String currencyCode;
  String languages;
  int geonameId;
  double west;
  double north;
  double east;
  double south;
  String postalCodeFormat;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryCode: json["countryCode"],
    countryName: json["countryName"],
    isoNumeric: json["isoNumeric"],
    isoAlpha3: json["isoAlpha3"],
    fipsCode: json["fipsCode"],
    continent: json["continent"],
    continentName: json["continentName"],
    capital: json["capital"],
    areaInSqKm: json["areaInSqKm"],
    population: json["population"],
    currencyCode: json["currencyCode"],
    languages: json["languages"],
    geonameId: json["geonameId"],
    west: json["west"].toDouble(),
    north: json["north"].toDouble(),
    east: json["east"].toDouble(),
    south: json["south"].toDouble(),
    postalCodeFormat: json["postalCodeFormat"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "countryName": countryName,
    "isoNumeric": isoNumeric,
    "isoAlpha3": isoAlpha3,
    "fipsCode": fipsCode,
    "continent": continent,
    "continentName": continentName,
    "capital": capital,
    "areaInSqKm": areaInSqKm,
    "population": population,
    "currencyCode": currencyCode,
    "languages": languages,
    "geonameId": geonameId,
    "west": west,
    "north": north,
    "east": east,
    "south": south,
    "postalCodeFormat": postalCodeFormat,
  };
}
