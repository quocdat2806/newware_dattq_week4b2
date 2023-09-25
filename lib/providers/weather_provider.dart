import 'package:flutter/material.dart';
import 'package:week4b2/models/weather.dart';
import 'package:week4b2/responsitory/weather_responsitory.dart';


class WeatherProvider extends ChangeNotifier{
  late  String nameCity;
  WeatherResponsitory weatherResponsitory = WeatherResponsitory();
  Weather ?weather;
  void search(String city) async {
    nameCity = city;
    var response = await weatherResponsitory.fetchWeatherResponsitory(city);
    weather = response;
    notifyListeners();
  }
}
