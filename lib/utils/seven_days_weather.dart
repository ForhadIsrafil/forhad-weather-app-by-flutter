import 'package:flutter/material.dart';

Column sevenDaysWeather(String day, IconData icon, String weatherValue) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            day,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
        ],
      ),
      Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.cyanAccent,
          ),
        ],
      ),
      Row(

        children: [
          Text(
            "$weatherValue °C",
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ],
  );
}
