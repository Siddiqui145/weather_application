import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/weather_provider.dart';
import 'package:weather_application/widgets/air_quality_index.dart';
import 'package:weather_application/widgets/hourly_forecast.dart';
import 'package:weather_application/widgets/weather_card.dart';
import 'package:weather_application/widgets/weekly_forecast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController(
    text: "London"
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).getWeather(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen',
        style: Theme.of(context).textTheme.titleMedium,),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {
            provider.getWeather(_controller.text);
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: provider.isLoading 
        ? const Center(
          child: CircularProgressIndicator(
            color: Colors.white70,
          ),
        )
          :    provider.weather == null 
              ?  Center(
                child: Text("Failed to Load data",
                style: Theme.of(context).textTheme.bodyLarge,),
              ) 
              : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeatherCard(weather: provider.weather!),
                    const SizedBox(
                      height: 20,
                    ),

                     Text("Hourly Forecast",
                    style: Theme.of(context).textTheme.bodySmall,),
                    const SizedBox(
                      height: 8,
                    ),
                    HourlyForecast(hourly: _mockHourly()),

                    const SizedBox(height: 20),
                        Text("Weekly Forecast", style: Theme.of(context).textTheme.bodySmall,),
                        const SizedBox(height: 8),
                        WeeklyForecast(daily: _mockWeekly()),

                    const SizedBox(height: 20),
                        Text("Air Quality", style: Theme.of(context).textTheme.bodySmall,),
                        const SizedBox(height: 8),
                        const AirQualityIndex(aqi: 117, status: "Moderate"),
                  ],
                ),
              )
            
          ),
        );
  }
  List<Map<String, dynamic>> _mockHourly() {
    return List.generate(6, (i) {
      return {
        'time': '${3 + i * 3} PM',
        'temp': 28 + i,
        'icon': '01d',
      };
    });
  }

  List<Map<String, dynamic>> _mockWeekly() {
    return [
      {'day': 'Wed', 'min': 24, 'max': 40, 'icon': '01d'},
      {'day': 'Thu', 'min': 26, 'max': 35, 'icon': '02d'},
      {'day': 'Fri', 'min': 27, 'max': 38, 'icon': '03d'},
      {'day': 'Sat', 'min': 25, 'max': 36, 'icon': '04d'},
      {'day': 'Sun', 'min': 23, 'max': 33, 'icon': '01d'},
    ];
  }
}