import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> countryList = <String>['One', 'Two', 'Three', 'Four'];

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  // final _countryList = ['bangladesh', 'srilanka', 'india'];
  // String? selectedCountry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forhad's Weather"),
        centerTitle: true,
        actions: const [
          Image(
            image: AssetImage("images/forhad.png"),
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ],
        shadowColor: Colors.green,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          // alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/weather.jpg'), fit: BoxFit.cover)),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                // height: 48.0,
                // width: 800.0,
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2.0),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    label: Text('Country Name',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    hintText: "Enter Country Name",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blueGrey,
                    filled: true,
                  ),
                  autocorrect: true,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 50.0,
                // color: Colors.black87,
                child: DropdownButton(
                    value: "BD",
                    dropdownColor: Colors.black45,
                    borderRadius: BorderRadius.circular(7.0),
                    icon: const Icon(Icons.pin_drop, color: Colors.tealAccent),
                    style: const TextStyle(color: Colors.white),
                    alignment: Alignment.center,
                    items: const [
                      DropdownMenuItem(
                          value: "BD",
                          alignment: Alignment.centerRight,
                          child: Text('BD')),
                      DropdownMenuItem(
                          value: "India",
                          alignment: Alignment.centerRight,
                          child: Text('India')),
                      DropdownMenuItem(
                          value: "Afghanistan",
                          alignment: Alignment.centerRight,
                          child: Text('Afghanistan')),
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
      ),
    );
  }
}
