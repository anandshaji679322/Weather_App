import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData;
  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    WeatherModel weatherModel = WeatherModel();
    weatherData = weatherModel.getWeatherData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ));
    });
  }

  // Navigator.push(context, MaterialPageRoute(
  // builder: (context) {
  // return LocationScreen(
  // locationWeather: weatherData,
  // );
  // },
  // ));

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    late double myMarginDouble;
    try {
      myMarginDouble = double.parse(myMargin);
    } catch (e) {
      myMarginDouble = 30;
      print(e);
    }
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}
