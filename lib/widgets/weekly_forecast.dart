import 'package:flutter/material.dart';

class WeeklyForecast extends StatelessWidget {
  final List<Map<String, dynamic>> daily;

  const WeeklyForecast({required this.daily, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: daily.map((day) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(day['day'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              Image.network(
                'https://openweathermap.org/img/wn/${day['icon']}@2x.png',
                width: 30,
              ),
              Text('${day['min']}° / ${day['max']}°',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
            ],
          ),
        );
      }).toList(),
    );
  }
}
