
import '../resources/weather_api_provider.dart';

class WeatherResponsitory{
  WeatherApiProvider weatherApiProvider = WeatherApiProvider();
  Future<dynamic>fetchWeatherResponsitory(String city)=>weatherApiProvider.fetchWeather(city);

}