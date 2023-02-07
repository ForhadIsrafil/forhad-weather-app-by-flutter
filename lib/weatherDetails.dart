import 'dart:math';
import 'package:flutter/material.dart';
import 'package:if_weather/utils/bar.dart';
import 'package:if_weather/utils/default_weather.dart';
import 'utils/seven_days_weather.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({Key? key, required this.inputCountry}) : super(key: key);

  String inputCountry;

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      appBar: myBar(),
      body: InputWeather(country: inputCountry),
    );
  }
}

class InputWeather extends StatefulWidget {
  InputWeather({Key? key, required this.country}) : super(key: key);

  String country;

  @override
  State<InputWeather> createState() => _InputWeatherState(country: country);
}

class _InputWeatherState extends State<InputWeather> {
  _InputWeatherState({Key? key, required this.country});

  String country;
  late Future<Weather> response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    response = getInputCityWeather(country);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: response,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return inputWeatherDetails(context, snapshot.data!, country);
        } else if (snapshot.hasError) {
          // return Text("${snapshot.error}");
          return Container(
            height: 350.0,
            width: 450.0,
            decoration: const BoxDecoration(
              color: Colors.red,
              // border: Border.all(
              //   color: Colors.blueGrey,
              //   width: 6.0,
              // ),
              // shape: BoxShape.rectangle,
              // borderRadius: BorderRadius.circular(15.0),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Failed To Load Data",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 20.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0),
            ),
          );
        }
        // By default, show a loading spinner/Progress.
        return const LinearProgressIndicator();
      },
    );
  }
}

Widget inputWeatherDetails(context, snapshot, country) {
  return Center(
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
                  "City: ${country.toString().toUpperCase()}",
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 55.0,
                // left: 85.50,
                child: Text(
                  "${snapshot.main['temp'].ceil()}°C",
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 85.0,
                // left: 85.50,
                child: Text(
                  "${snapshot.weather[0]['description']}",
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 28.0,
                left: 82.50,
                child: Image(
                  image: NetworkImage(
                      "https://openweathermap.org/img/wn/${snapshot.weather[0]['icon']}@2x.png"),
                  color: Colors.white,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                // left: 85.50,
                child: Text(
                  "Humidity: ${snapshot.main['humidity']}",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
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
                children: [
                  const Icon(
                    Icons.sunny,
                    size: 50,
                    color: Colors.yellow,
                  ),
                  const Text(
                    "Sunrise",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  Text(
                    "${integerToTime(snapshot.sys['sunrise'])} AM",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(bottom: 95, right: 10),
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
                    "${integerToTime(snapshot.sys['sunset'])} PM",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
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
