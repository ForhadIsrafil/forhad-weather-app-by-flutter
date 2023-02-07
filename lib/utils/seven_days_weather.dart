import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_weather/utils/default_weather.dart';
import 'dart:convert';

import 'package:if_weather/weatherDetails.dart';

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

Center homeWeather(context, snapshot) {
  return Center(
    child: ListBody(children: [
      Container(
        // color: Colors.cyan,
        height: 200.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: Colors.teal,
            border: Border.all(
              color: Colors.blueGrey,
              width: 6.0,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0)),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 100.0),
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Text.rich(TextSpan(style: const TextStyle(), children: [
              const TextSpan(
                  text: "Dhaka\n",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              TextSpan(
                text: "Temperature: ${snapshot.main['temp'].ceil()}°\n",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextSpan(
                text: "${snapshot.weather[0]['description']}\n",
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              WidgetSpan(
                  child: Image(
                image: NetworkImage(
                    "https://openweathermap.org/img/wn/${snapshot.weather[0]['icon']}@2x.png"),
                color: Colors.white,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              )),
            ])),
          ],
        ),
      ),
      // sunrise and sunset
      Stack(
        alignment: AlignmentDirectional.center,
        // fit: StackFit.expand,
        children: [
          SizedBox(
            // height: 50,
            width: MediaQuery.of(context).size.width,
            // height: random.nextInt(200).toDouble() >= 100 ? random.nextInt(200).toDouble() : 200.0,
            // color: Color.fromARGB(random.nextInt(255), random.nextInt(255),
            //     random.nextInt(255), random.nextInt(255)),

            child: CustomPaint(
              painter: ShapePainter(),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(bottom: 100, left: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.sunny,
                  size: 50,
                  color: Colors.yellow,
                ),
                const Text(
                  "Sunrise",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Text(
                  integerToTime(snapshot.sys['sunrise']),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(bottom: 100, right: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.sunny,
                  size: 50,
                  color: Colors.black54,
                ),
                const Text(
                  "Sunset",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                Text(
                  integerToTime(snapshot.sys['sunset']),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ]),
  );
}

/*
Container(
              color: Colors.white,
              height: 80.0,
              child: ListView(
                padding: const EdgeInsets.all(1.0),
                children: const [
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
                "Next 5 day Weather of the city",
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
* */
