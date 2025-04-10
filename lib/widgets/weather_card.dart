import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weather.cityName,
            style:Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${weather.temperature}°C',
                style:Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white
              ),
              ),
              Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                width: 60,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            weather.description,
            style:Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
