import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_weather/weatherDetails.dart';
import 'utils/bar.dart';
import 'package:requests/requests.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myBar(),
      body: const HandleWeatherInput(),
    );
  }
}

class HandleWeatherInput extends StatefulWidget {
  const HandleWeatherInput({Key? key}) : super(key: key);

  @override
  State<HandleWeatherInput> createState() => _HandleWeatherInputState();
}

class _HandleWeatherInputState extends State<HandleWeatherInput> {
  // static List<String> countryList = <String>['One', 'Two', 'Three', 'Four'];

  var _defaultCountry = "City";
  var _inputCountry;
  bool isError = false;

  final _inputCountryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _inputCountryController.addListener(_updateCountry);

    //  get default weather data start

    //  get default weather data end
  }

  void _updateCountry() {
    setState(() {
      _inputCountry = _inputCountryController.text;
    });
  }

  // void countryValue(value) {
  //   setState(() {
  //     defaultCountry = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        // alignment: Alignment.topCenter,
        // decoration: const BoxDecoration(
        //   gradient: ,
        //   image: DecorationImage(
        //       image: AssetImage('images/weather.jpg'), fit: BoxFit.cover),
        // ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              // height: 48.0,
              // width: 800.0,
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(2.0),
              child: TextFormField(
                controller: _inputCountryController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                // onChanged: (value) {},
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  label: const Text('Country Name',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  hintText: "Enter Country Name",
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 200,
                          strokeAlign: StrokeAlign.outside,
                          color: Colors.black,
                          style: BorderStyle.solid)),
                  fillColor: Colors.teal,
                  filled: true,
                  errorText: isError == true
                      ? "Country Name Is Too Short,\nAt Least 4 Words"
                      : null,
                  errorStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                autocorrect: true,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // print("hitted.....");
                  if (_inputCountryController.text.length < 4) {
                    isError = true;
                    Future.delayed(const Duration(seconds: 10), () {
                      setState(() {
                        isError = false;
                      });
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        // return const WeatherDetails(inputCountry: _inputCountryController.text);
                        return WeatherDetails(
                          inputCountry: _inputCountryController.text,
                        );
                      }),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 14.0,
                  backgroundColor: Colors.teal,
                  fixedSize: const Size(100, 30),
                  side: const BorderSide(
                      color: Colors.cyanAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // minimumSize: const Size(10, 50),
                  // maximumSize: const Size(10, 50),
                  padding: const EdgeInsets.all(2),
                  shadowColor: Colors.cyanAccent,
                ),
                child: const Text("Submit"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 50.0,
              // color: Colors.black87,
              child: DropdownButton(
                  value: _defaultCountry,
                  dropdownColor: Colors.black45,
                  focusColor: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(7.0),
                  icon: const Icon(Icons.pin_drop, color: Colors.cyan),
                  style: const TextStyle(color: Colors.tealAccent),
                  alignment: Alignment.center,
                  items: [
                    DropdownMenuItem(
                      value: "City",
                      enabled: false,
                      alignment: Alignment.centerRight,
                      child: const Text("City"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "City";
                        });
                      },
                    ),
                    DropdownMenuItem(
                      value: "Dhaka",
                      alignment: Alignment.centerRight,
                      child: const Text("Dhaka"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "Dhaka";
                        });
                      },
                    ),
                    DropdownMenuItem(
                      value: "Kabul",
                      alignment: Alignment.centerRight,
                      child: const Text("Kabul"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "Kabul";
                        });
                      },
                    ),
                    DropdownMenuItem(
                      value: "Delhi",
                      alignment: Alignment.centerRight,
                      child: const Text("Delhi"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "Delhi";
                        });
                      },
                    ),
                  ],
                  onChanged: (String? value) {}),
            ),
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
                children: const [
                  Text.rich(TextSpan(style: TextStyle(), children: [
                    TextSpan(
                        text: "Dhaka\n",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    TextSpan(
                      text: "Temperature: 30°\n",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text: "Clear sky\n",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    WidgetSpan(
                        child: Image(
                      image: NetworkImage(
                          "https://openweathermap.org/img/wn/01n@2x.png"),
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                    )),
                  ])),
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
                  padding: const EdgeInsets.only(bottom: 100, left: 10, top: 10),
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
                  padding:
                      const EdgeInsets.only(bottom: 100, right: 10, top: 10),
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
    ));
  }
}

// const Text.rich(TextSpan(style: TextStyle(), children: [
// TextSpan(
// text: "Dhaka\n",
// style: TextStyle(
// fontSize: 35.0,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// )),
// TextSpan(
// text: "Temperature: 30°\n",
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.bold,
// color: Colors.white),
// ),
// TextSpan(
// text: "Clear sky\n",
// style: TextStyle(
// fontSize: 15.0,
// fontWeight: FontWeight.bold,
// color: Colors.black54,
// ),
// ),
// WidgetSpan(
// child: Image(
// image: NetworkImage(
// "https://openweathermap.org/img/wn/01n@2x.png"),
// color: Colors.yellow,
// alignment: Alignment.center,
// fit: BoxFit.fill,
// )),
// ])),
