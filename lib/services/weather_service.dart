import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/secrets/api_key.dart';

class WeatherService {

 Future<WeatherModel?> fetchWeather(String city) async {
  final box = Hive.box('weatherCache');
  final cacheData = box.get(city);

  if (cacheData != null){
    print("Loading weather from cache for $city");
    return WeatherModel.fromJson(Map<String, dynamic>.from(cacheData));
  }

  //final url = "https://api.openweathermap.org/data/2.5/weather?q=$city,uk&APPID=$apiKey";
  final url = "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey&units=metric";
  final response = await http.get(Uri.parse(url));

  print("Request URL: $url");
  print("Response Body: ${response.body}");


  if (response.statusCode == 200){
    final jsonData = jsonDecode(response.body);
    box.put(city, jsonData); // Complete data would be saved rawly for future ease
    return WeatherModel.fromJson(jsonData);
  }
  else {
      print('Failed to load weather data: ${response.statusCode}');
      return null;
    }
  }
}