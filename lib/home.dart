import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_weather/utils/seven_days_weather.dart';
import 'package:if_weather/weatherDetails.dart';
import 'utils/bar.dart';
import 'utils/default_weather.dart';
import 'dart:convert';

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
  var _inputCity;
  bool isError = false;

  final _inputCityController = TextEditingController();
  late Future<Weather> response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _inputCityController.addListener(_updateCity);
    response = getDefaultData();
  }

  void _updateCity() {
    setState(() {
      _inputCity = _inputCityController.text;
    });
  }

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
                controller: _inputCityController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                // onChanged: (value) {},
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  label: const Text('City Name',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  hintText: "Enter City Name",
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
                      ? "City Name Is Too Short,\nAt Least 4 Words"
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
                  if (_inputCityController.text.length < 4) {
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
                        // return const WeatherDetails(inputCountry: _inputCityController.text);
                        return WeatherDetails(
                          inputCountry: _inputCityController.text,
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
            // dropdown button
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
                  onChanged: (String? value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        // return const WeatherDetails(inputCountry: _inputCityController.text);
                        return WeatherDetails(
                          inputCountry: value.toString(),
                        );
                      }),
                    );
                  }),
            ),

            FutureBuilder<Weather>(
              future: response,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return homeWeather(context, snapshot);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner/Progress.
                return const LinearProgressIndicator();
              },
            ),
          ],
        ),
      ),
    ));
  }
}

//  get default weather data start
// data() {
//   var res = getDefaultData();
//   if (res[0] != false) {
//     return res[1];
//   }
// }
// //  get default weather data end
