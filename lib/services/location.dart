import 'package:geolocator/geolocator.dart';
class Location{
  late LocationPermission permission;
  late Position position;
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async{
    permission = await Geolocator.requestPermission();
    try{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    }catch(e){
      print(e);
    }
  }
}