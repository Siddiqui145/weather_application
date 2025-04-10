import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final List<Map<String, dynamic>> hourly;

  const HourlyForecast({
    required this.hourly,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hourly.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          
          final hour = hourly[index];

          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(16)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(hour['time'],
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                Image.network(
                  'https://openweathermap.org/img/wn/${hour['icon']}@2x.png',
                  width: 40,),
                  Text('${hour['temp']}°C',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),)
              ],
            ),
          );
        }, ),
    );
  }
}