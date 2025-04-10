import 'package:flutter/material.dart';

class AirQualityIndex extends StatelessWidget {
  final int aqi;
  final String status;

  const AirQualityIndex({
    super.key,
    required this.aqi,
    required this.status
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("AQI: $aqi", style: Theme.of(context).textTheme.titleSmall),
          Text(status, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
      );
  }
}