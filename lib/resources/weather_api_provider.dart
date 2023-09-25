import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week4b2/models/weather.dart';

class WeatherApiProvider {
  Future<Weather> fetchWeather(String city) async {
    var response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=51e26750089847ff9a495455232309&q=$city'),
    );
    if (response.statusCode == 200) {
      var city = json.decode(response.body)['location']["name"];
      var last_updated = json.decode(response.body)['current']["last_updated"].split(' ')[1];
      var temp_c = json.decode(response.body)['current']["temp_c"];
      var text = json.decode(response.body)['current']["condition"]['text'];
      var icon = json.decode(response.body)['current']["condition"]['icon'];
      var temp_f = json.decode(response.body)['current']["temp_f"];

      var maxtemp_c = json.decode(response.body)["forecast"]['forecastday'][0]
          ['day']['maxtemp_c'];
      var mintemp_c = json.decode(response.body)["forecast"]['forecastday'][0]
          ['day']['mintemp_c'];
      var maxtemp_f = json.decode(response.body)["forecast"]['forecastday'][0]
          ['day']['maxtemp_f'];
      var mintemp_f = json.decode(response.body)["forecast"]['forecastday'][0]
          ['day']['mintemp_f'];
      Weather weather = Weather(city, last_updated, temp_c, text, icon,
          maxtemp_c, mintemp_c, maxtemp_f, mintemp_f,temp_f);
      return weather;
    } else {
      throw Error();
    }
  }
}
