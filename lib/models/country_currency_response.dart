import 'dart:convert';

CountryCurrencyResponse countryCurrencyResponseFromJson(String str) => CountryCurrencyResponse.fromJson(json.decode(str));

String countryCurrencyResponseToJson(CountryCurrencyResponse data) => json.encode(data.toJson());

class CountryCurrencyResponse {
  CountryCurrencyResponse({
    required this.motd,
    required this.success,
    required this.base,
    required this.date,
    required this.rates,
  });

  Motd motd;
  bool success;
  String base;
  DateTime date;
  Rates rates;

  factory CountryCurrencyResponse.fromJson(Map<String, dynamic> json) => CountryCurrencyResponse(
    motd: Motd.fromJson(json["motd"]),
    success: json["success"],
    base: json["base"],
    date: DateTime.parse(json["date"]),
    rates: Rates.fromJson(json["rates"]),
  );

  Map<String, dynamic> toJson() => {
    "motd": motd.toJson(),
    "success": success,
    "base": base,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "rates": rates.toJson(),
  };
}

class Motd {
  Motd({
    required this.msg,
    required this.url,
  });

  String msg;
  String url;

  factory Motd.fromJson(Map<String, dynamic> json) => Motd(
    msg: json["msg"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "url": url,
  };
}

class Rates {
  Rates({
    required this.inr,
  });

  double inr;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    inr: json["INR"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "INR": inr,
  };
}
