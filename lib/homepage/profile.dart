import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gen128/profile/user_info.dart';
import 'file:///C:/Users/DELL-PC/AndroidStudioProjects/gen128/lib/profile/my_reports.dart';
import 'package:gen128/shared/custom_app_bar.dart';
import 'package:gen128/shared/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:gen128/homepage/profile.dart';
import 'package:gen128/profile/Locations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  final surname;
  final firstname;
  final address;
  final phonenumber;
  final email;
  final picture;

  Profile ({this.surname,
    this.firstname,
    this.address,
    this.phonenumber,
    this.email,
    this.picture
  });


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//Applying get request.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: FlatButton(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_forward, color: Colors.green),
                    Text(" Log Out", style: TextStyle(color: Colors.green),)
                  ],
                ),
              ),
            )
          ],
          bottom: TabBar(
              tabs:[
                Tab(
                  child:  Column(
                    children: [
                      Icon(Icons.person, color: Colors.white,),
                      Text("My profile"),
                    ],
                  )
                  ),
                Tab(
                    child:  Column(
                      children: [
                        Icon(Icons.highlight, color: Colors.white,),
                        Text("My Reports"),
                      ],
                    )
                ),
                Tab(
                    child:  Column(
                      children: [
                        Icon(Icons.location_city, color: Colors.white,),
                        Text("Locations"),
                      ],
                    )
                ),
              ]
          ),
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
            children: [
             UserInfo(surname: widget.surname,firstname: widget.firstname,phonenumber: widget.phonenumber,
               address: widget.address, email: widget.email, picture: widget.picture,),
             MyReport(),
             Locations()
            ]
        )
      ),
      )
    );
  }
}