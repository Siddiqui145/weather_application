import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/weather_provider.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        Provider.of<WeatherProvider>(context, listen: false).getWeather(value);
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            Provider.of<WeatherProvider>(context, listen: false).getWeather(controller.text);
          },
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
