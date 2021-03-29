import 'package:flutter/material.dart';
import 'package:gen128/shared/custom_app_bar.dart';
var textInputDecoration =InputDecoration(
    fillColor: Colors.green[100],
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white, width:2.0)

    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.pink, width:2.0 )
    )
);



var textInputDecorationTwo =InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintText: "Location",
    hintStyle: TextStyle(color: Colors.blueGrey),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white, width:2.0)

    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.pink, width:2.0 )
    ),
    prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25.0),
    suffixIcon: IconButton(
        icon: Icon(Icons.clear, color:Colors.red),
        onPressed: (){
            CustomAppBar.searchLocation.clear();
        },
    )
);


var description = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    //hintText: "Location",
    hintStyle: TextStyle(color: Colors.blueGrey),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.white, width:2.0)

    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: Colors.pink, width:2.0 )
    ),
);