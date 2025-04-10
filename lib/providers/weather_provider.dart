import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier{

  final WeatherService _weatherService = WeatherService();

  WeatherModel? weather;
  bool isLoading = false;

  Future<void> getWeather(String city) async {

    if (city.trim().isEmpty) {
      print("City name is empty");
      weather = null;
      isLoading = false;
      notifyListeners();
      return;
      }

    isLoading = true;
    notifyListeners();

    try {
      final result = await _weatherService.fetchWeather(city);
      weather = result;
    }
    catch (e){
      print("Error fetching Weather : $e");
      weather = null;
    }

    isLoading = false;
    notifyListeners();
  }
}