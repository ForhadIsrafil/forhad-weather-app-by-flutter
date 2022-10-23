import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_weather/weatherDetails.dart';
import 'utils/bar.dart';

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

  var _defaultCountry = "BD";
  var _inputCountry;
  bool isError = false;

  final _inputCountryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _inputCountryController.addListener(_updateCountry);
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
                  borderRadius: BorderRadius.circular(7.0),
                  icon: const Icon(Icons.pin_drop, color: Colors.cyan),
                  style: const TextStyle(color: Colors.tealAccent),
                  alignment: Alignment.center,
                  items: [
                    DropdownMenuItem(
                      value: "BD",
                      alignment: Alignment.centerRight,
                      child: const Text("BD"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "BD";
                        });
                      },
                    ),
                    DropdownMenuItem(
                      value: "India",
                      alignment: Alignment.centerRight,
                      child: const Text("India"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "India";
                        });
                      },
                    ),
                    DropdownMenuItem(
                      value: "Afghanistan",
                      alignment: Alignment.centerRight,
                      child: const Text("Afghanistan"),
                      onTap: () {
                        setState(() {
                          _defaultCountry = "Afghanistan";
                        });
                      },
                    ),
                  ],
                  onChanged: (String? value) {}),
            ),
            Container(
              // color: Colors.cyan,
              height: 120.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 6.0,
                  ),
                  shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(20.0),
                  ),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 100.0),
              padding: const EdgeInsets.all(10.0),
              child: const Text.rich(TextSpan(style: TextStyle(), children: [
                TextSpan(
                    text: "Dhaka\n",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: "30°",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ])),
            ),
          ],
        ),
      ),
    ));
  }
}
