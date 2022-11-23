import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:med_collapp/controllers/get_location_controller.dart';
import 'package:med_collapp/models/country_detail_response.dart';
import 'package:med_collapp/util/const/app_constants.dart';
import 'package:xml2json/xml2json.dart';


class GetLocationService extends GetxService{
  GetLocationController getLocationController = Get.put(GetLocationController());
  Future getCountryCodeAPI(double lat,double lng) async {
    var url = AppConstants.geoCountryCode(lat, lng);
    var response = await get(
      Uri.parse(url),
    );
    print("this: $url");
    if(response.statusCode == 200){
      getLocationController.countryCode = response.body;
      print(getLocationController.countryCode);
      Future.delayed(const Duration(seconds: 5),(){getCountryDetailsAPI();});
    }
  }
  Future getCountryDetailsAPI() async {
    final Xml2Json xml2json = Xml2Json();
    var url = "http://api.geonames.org/countryInfo?country=IN&username=medcollapp";
    print("This is my country code : ${getLocationController.countryCode}");
    print(url);
    var response = await get(
      Uri.parse(url),
    );
    if(response.statusCode == 200){
      xml2json.parse(response.body);
      var jsonData = xml2json.toGData();
      var detail = json.decode(jsonData);
      print(detail);
      print(detail["geonames"]["country"]["countryCode"]);
    }
  }

}