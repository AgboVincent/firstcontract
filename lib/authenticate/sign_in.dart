import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gen128/authenticate/get_user.dart';
import 'package:gen128/authenticate/sign_up.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:gen128/shared/constants.dart';
import 'package:gen128/homepage/home.dart';
import 'package:intl/intl.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String message;
  List data;
  String surname;
  String firstname;
  String phonenumber;
  String address;
  String emailAddress;
  String picture;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field  state
  String email = '';
  String password = '';
  String error = '';

  Future<String> loginUser() async {
    String url = "http://192.168.43.33/form/user_login.php";
    final response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    String responseData = json.encode(response.body);
    message = jsonDecode(responseData);
    print(message);
    if (message.contains("email")) {
      print("logging in");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    surname: surname,
                    firstname: firstname,
                    address: address,
                    email: emailAddress,
                    phonenumber: phonenumber,
                    picture: picture,
              )));
      data = jsonDecode(message);
      data.forEach((element) {
        Map obj = element;
        surname = obj['surname'];
        firstname = obj['firstname'];
        phonenumber = obj['phonenumber'];
        address = obj['area'];
        emailAddress = obj['email'];
        picture = obj['profile_image'];
      });
    } else {
      setState(() {});
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (true),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? ' Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6
                        ? ' Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  child: Center(
                    child: Container(
                      width: 400,
                      height: 50,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.green[800],
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              loginUser();
                              // jsonData();
                            }
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" Don't have an account? "),
                    GestureDetector(
                      child: Text(
                        "Sign up here ",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15.0,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
