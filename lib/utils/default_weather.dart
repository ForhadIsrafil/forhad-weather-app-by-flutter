import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:requests/requests.dart';
import 'dart:async';

Future<Weather> getDefaultData() async {
  var res = await Requests.get(
      "https://api.openweathermap.org/data/2.5/weather?q=Dhaka&units=metric&appid=564a930b3fa90e1e2ae07e673ca72227");
  if (res.statusCode == 200) {
    // print(res.json());
    // print(res.json()['main']); // tempretures details
    // print(res.json()['weather'][0]); // details, icon
    // print(res.json()['sys']); // sunrise, pressure
    //
    // print(res.json()['main']['temp']);
    // var r = Requests.get('https://google.com');
    // r.raiseForStatus();
    // String body = r.content();
    // return jsonDecode(res.content());
    return Weather.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class Weather {
  final main;
  final weather;
  final sys;

  Weather({
    required this.main,
    required this.weather,
    required this.sys,
  });

  factory Weather.fromJson(Map json) {
    return Weather(
      main: json['main'],
      weather: json['weather'],
      sys: json['sys'],
    );
  }
}

integerToTime(integerValue) {
  var time = DateTime.fromMillisecondsSinceEpoch(integerValue * 1000);
  return "${time.hour}:${time.minute}";
}
