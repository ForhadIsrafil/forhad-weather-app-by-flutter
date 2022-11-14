import 'dart:math';
import 'package:flutter/material.dart';
import 'package:if_weather/utils/bar.dart';
import 'utils/seven_days_weather.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({Key? key, required this.inputCountry}) : super(key: key);

  String inputCountry;

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
              height: 150.0,
              padding: const EdgeInsets.only(left: 90.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 20.0,
                    // left: 85.50,
                    child: Text(
                      "CName: $inputCountry",
                      style: const TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Positioned(
                    top: 55.0,
                    // left: 85.50,
                    child: Text(
                      "27°C",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Positioned(
                    top: 85.0,
                    // left: 85.50,
                    child: Text(
                      "Cloudy",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    // left: 85.50,
                    child: Text(
                      "Air Quality 8(AQI)",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.only(bottom: 95, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.sunny,
                        size: 50,
                        color: Colors.yellow,
                      ),
                      Text(
                        "Sunrise",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Text(
                        "5:50",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(bottom: 95, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.sunny,
                        size: 50,
                        color: Colors.black54,
                      ),
                      Text(
                        "Sunset",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        "5:50",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// FOR PAINTING LINES
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Offset startingPoint = Offset(20, size.height / 2);
    Offset endingPoint = Offset(size.width - 20, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);

    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
