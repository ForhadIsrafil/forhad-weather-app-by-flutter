import 'package:flutter/material.dart';
import 'package:if_weather/home.dart';
import 'weatherDetails.dart';
import 'home.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'iF Weather',
      home: WeatherDetails(),
    );
  }
}
