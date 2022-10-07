import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar myBar() {
  return AppBar(
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
  );
}
