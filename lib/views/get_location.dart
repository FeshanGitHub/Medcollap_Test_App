import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_location_controller.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  GetLocationController getLocationController = Get.put(GetLocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get your location"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
           await getLocationController.getLocation();
          },
          child: const Text("Get Location"),
        ),
      ),
    );
  }
}
