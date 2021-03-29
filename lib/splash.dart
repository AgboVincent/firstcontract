import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen128/scroll.dart';
import 'scroll.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScrollPage() ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
         child: Image(
           image: AssetImage("assets/Splash1.png"),
           fit: BoxFit.fill,
         ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
