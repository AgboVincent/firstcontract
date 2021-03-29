import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gen128/authenticate/sign_in.dart';
import 'package:gen128/authenticate/get_user.dart';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}
class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/Splash2.png"),
                fit: BoxFit.fill,
              )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 20,
                  right: 50,
                  left: 180,
                  child: GestureDetector(
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/Splash3.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 20,
                  right: 50,
                  left: 180,
                  child: GestureDetector(
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/Splash4.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 20,
                  right: 50,
                  left: 180,
                  child: GestureDetector(
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


