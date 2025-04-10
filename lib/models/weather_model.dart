class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final double pressure;
  final double humidity;
  final String icon;
  final double feelsLike;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.icon,
    required this.feelsLike,
    required this.windSpeed
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'], 
      temperature: (json['main']['temp']as num).toDouble() , 
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      pressure: (json['main']['pressure'] as num).toDouble(), 
      humidity: (json['main']['humidity'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': cityName,
      'main': {
        'temp': temperature,
        'feels_like': feelsLike,
        'humidity': humidity,
        'pressure': pressure,
      },
      'weather': [
        {
          'description': description,
          'icon': icon,
        }
      ],
      'wind': {
        'speed': windSpeed,
      }
    };
  }
}
