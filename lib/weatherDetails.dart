import 'package:flutter/material.dart';
import 'package:if_weather/utils/bar.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: 200.0,
            ),
            Container(
              color: Colors.indigo,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
//
// Text(
// "Country Name",
// style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
// Text(
// "27°C",
// style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
// Text(
// "Cloudy",
// style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
