import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';

const apikey = 'ff64aa5799c8c03d0fb58b45f37c6e70';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async{
    var url = '$openWeatherMapURL?q=$city&appid=$apikey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url: url);

    var weatherDate = await networkHelper.getData();
    return weatherDate;
  }

  Future<dynamic> getWeatherData() async {
    Location l = new Location();
    await l.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${l.latitude}&lon=${l.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
