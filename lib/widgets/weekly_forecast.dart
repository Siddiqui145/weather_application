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
              Expanded(
              flex: 2,
              child: Text(
                day['day'],
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
              Image.network(
              'https://openweathermap.org/img/wn/${day['icon']}@2x.png',
              width: 30,
              errorBuilder: (_, __, ___) => const Icon(Icons.error, color: Colors.red),
            ),
              Expanded(
              flex: 3,
              child: Text(
                '${day['min']}° / ${day['max']}°',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
