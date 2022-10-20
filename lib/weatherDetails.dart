import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:if_weather/utils/bar.dart';
import 'utils/seven_days_weather.dart';
import 'main.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: myBar(),
      body: Center(
        child: ListView(
          children: [
            Container(
              color: Colors.teal,
              height: 200.0,
              padding: const EdgeInsets.only(left: 90.0),
              child: Stack(
                children: const [
                  Positioned(
                    top: 20.0,
                    // left: 85.50,
                    child: Text(
                      "Country Name",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 55.0,
                    // left: 85.50,
                    child: Text(
                      "27°C",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 85.0,
                    // left: 85.50,
                    child: Text(
                      "Cloudy",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    // left: 85.50,
                    child: Text(
                      "Air Quality 8(AQI)",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 205.0,
              child: ListView(
                padding: const EdgeInsets.all(1.0),
                children: const [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Icon(Icons.cloud, color: Colors.white),
                    ),
                    title: Text(
                      "Yesterday",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Cloudy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "30/27 °C",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Icon(Icons.cloud, color: Colors.white),
                    ),
                    title: Text(
                      "Today",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Husky",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "30/27 °C",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Icon(Icons.cloud, color: Colors.white),
                    ),
                    title: Text(
                      "Tomorrow",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Cloudy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "30/27 °C",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.indigo,
              padding: const EdgeInsets.all(5.0),
              height: 50.0,
              child: const Text(
                "Next 7 day Weather of the country",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              color: Colors.indigo,
              padding: const EdgeInsets.all(5.0),
              height: 150.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sevenDaysWeather("Sat", Icons.cloud_circle, "20"),
                  sevenDaysWeather("Sun", Icons.cloud_circle, "20"),
                  sevenDaysWeather("Mon", Icons.thunderstorm, "20"),
                  sevenDaysWeather("Tue", Icons.thunderstorm_outlined, "20"),
                  sevenDaysWeather("Wed", Icons.cloud_circle, "20"),
                  sevenDaysWeather("Thur", Icons.cloud_circle, "20"),
                  sevenDaysWeather("Fri", Icons.water_drop_outlined, "20"),
                ],
              ),
            ),
            Container(
              // height: random.nextInt(200).toDouble() >= 100 ? random.nextInt(200).toDouble() : 200.0,
              // color: Color.fromARGB(random.nextInt(255), random.nextInt(255),
              //     random.nextInt(255), random.nextInt(255)),
              // child: ,

            ),
          ],
        ),
      ),
    );
  }
}

class SunRiseSed extends StatefulWidget {
  const SunRiseSed({Key? key}) : super(key: key);

  @override
  State<SunRiseSed> createState() => _SunRiseSedState();
}

class _SunRiseSedState extends State<SunRiseSed> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          // color: Colors.red,
          child: AnimatedAlign(

            alignment: selected ? Alignment.topRight : Alignment.topLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInCubic,
            child: const Icon(Icons.sunny, size: 50.0, color: Colors.yellow,),
          ),
        ),
      ),
    );
  }
}