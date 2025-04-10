class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final int pressure;
  final int humidity;
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
      temperature: json['main']['temp'] , 
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'], 
      humidity: json['main']['humidity'],
      icon: json['weather'][0]['icon'],
      feelsLike: json['main']['feels_like'],
      windSpeed: json['wind']['speed'],
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
