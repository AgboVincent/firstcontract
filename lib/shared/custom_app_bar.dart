import 'package:flutter/material.dart';
import 'package:gen128/shared/constants.dart';


class CustomAppBar extends AppBar {

   static TextEditingController searchLocation = TextEditingController();
  CustomAppBar({Key key, Widget title})
      : super(
    key: key,
    centerTitle: true,
    backgroundColor: Colors.green,
    elevation: 2.0,
    actions: <Widget>[

      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
        },
      ),
    ],
    title: Container(
      margin: new EdgeInsets.fromLTRB(0,15.0,0,15.0),
      child: TextFormField(
        style: TextStyle(fontSize: 15.0, color: Colors.grey),
        controller: searchLocation,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Location",
            hintStyle: TextStyle(color: Colors.blueGrey),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide( color: Colors.white, width:5.0)
            ),
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide( color: Colors.pink, width:10.0 )
            // ),
            prefixIcon: Icon(Icons.search,color: Colors.grey,size: 20.0),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color:Colors.red),
              onPressed: (){
               searchLocation.clear();
              },
            )
        ),
      ),
    )
  );
}