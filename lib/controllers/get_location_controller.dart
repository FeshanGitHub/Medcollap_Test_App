import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:med_collapp/services/get_location_services.dart';

class GetLocationController extends GetxController{
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  late Future<Position> streamPosition;
  String countryCode = "";
  var countryDetail = {}.obs;

  getLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      await Geolocator.openLocationSettings();
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location services are disabled");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location services are permanently denied,we cannot request permissions.");
    }
    streamPosition =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then((Position position) {
          latitude.value = position.latitude;
          longitude.value = position.longitude;
          return position;
        });
   await GetLocationService().getCountryCodeAPI(latitude.value, longitude.value);

  }
}