import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

main() {
  // var r = Requests.get('https://google.com');
  // print(r.statusCode);
  var client = http.Client();
  try {
    var response = client.get(Uri.https('https://openweathermap.org/img/wn/01n@2x.png'));
    var decodedResponse = response;
    print(decodedResponse);
  } finally {
    client.close();
  }
  return true;
}
