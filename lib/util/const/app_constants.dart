class AppConstants {
    static geoCountryCode(double lat,double lng){
       String getCountryCode = "http://api.geonames.org/countryCode?lat=$lat&lng=$lng&username=medcollapp";
       return getCountryCode;
    }
    static geoCountryDetails(String countryCode){
      String getCountryDetails = "http://api.geonames.org/countryInfo?country=$countryCode&username=medcollapp";
      return getCountryDetails;
    }
   static const String getCountryCurrency = "https://api.exchangerate.host/latest?base=USD&symbols=INR&amount=1&places=2";
}

