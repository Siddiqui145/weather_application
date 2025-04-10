import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier{

  final WeatherService _weatherService = WeatherService();

  WeatherModel? weather;
  bool isLoading = false;

  Future<void> getWeather(String city) async {
    isLoading = true;
    notifyListeners();

    weather = await _weatherService.fetchWeather(city);

    isLoading = false;
    notifyListeners();
  }
}