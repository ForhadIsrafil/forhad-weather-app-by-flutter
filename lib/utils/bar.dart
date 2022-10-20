import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar myBar() {
  return AppBar(
    title: const Text("Forhad's Weather"),
    centerTitle: true,
    actions: const [
      CircleAvatar(
        foregroundImage: AssetImage("images/forhad.png"),
        maxRadius: 30.0,
        // alignment: Alignment.center,
        // fit: BoxFit.contain,
      ),
    ],
    shadowColor: Colors.green,
    backgroundColor: Colors.blueGrey,
  );
}
