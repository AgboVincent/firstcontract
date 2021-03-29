import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen128/splash.dart';



void main() {
  runApp(
      MaterialApp(
          title: 'Welcome',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyApp()
      ));
}
