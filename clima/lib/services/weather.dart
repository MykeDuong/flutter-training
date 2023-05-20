import 'location.dart';
import 'networking.dart';

const apiKey = '3ad0f3013f9020b578f7133c7fd0d4cb';

class WeatherModel {
  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': '$apiKey',
      'units': 'metric'
    });

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future getCityWeather(String city) async {
    Location location = Location();
    await location.getCurrentPosition();

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': city, 'appid': '$apiKey', 'units': 'metric'});

    NetworkHelper networkHelper = NetworkHelper(url: url);

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
      return '🌫';
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
