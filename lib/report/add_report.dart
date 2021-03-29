import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen128/report/armed_robbery.dart';
import 'package:gen128/report/civil_unrest.dart';
import 'package:gen128/report/fire_outbreak.dart';
import 'package:gen128/report/kidnap.dart';
import 'package:gen128/report/rape.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AddReport(),
    );
  }
}

 class AddReport extends StatefulWidget {
  @override
  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Submit A Report"
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,30,0,0),
              child: Text(
                "Armed Robbery",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => ArmedRobbery()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,30,0,0),
              child: Text(
                "Rape",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => Rape()));

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,30,0,0),
              child: Text(
                "Kidnap",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => Kidnap()));

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,30,0,0),
              child: Text(
                "Civil Unrest",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => CivilUnrest()));

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0,30,0,0),
              child: Text(
                "Fire Outbreak",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => FireOutbreak()));

            },
          )
        ],
      ),
    );
  }
}
