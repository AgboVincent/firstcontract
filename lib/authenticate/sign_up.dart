import 'package:flutter/material.dart';
import 'package:gen128/authenticate/sign_in.dart';
import 'package:gen128/shared/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}


class User {

  final String surname;
  final String firstname;
  final String phonenumber;
  final String email;
  final String area;
  final String landmark;
  final String password;
  final String cpassword;

  User({

    this.surname,
    this.firstname,
    this.phonenumber,
    this.email,
    this.area,
    this.landmark,
    this.password,
    this.cpassword,

  });
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field  state
  String surname = '';
  String firstname = '';
  String phonenumber = '';
  String email = '';
  String area = '';
  String landmark = '';
  String password = '';
  String cpassword = '';
  String error = '';


   Future <List<User>> createUser() async{
     String url = "http://192.168.8.113/form/add_user.php";
     final response = await http.post(url, body:{
        "surname": surname,
        "firstname": firstname,
        "phonenumber": phonenumber,
        "email": email,
        "area": area,
        "landmark" : landmark,
        "password" : password,
        "cpassword": cpassword
     });

     var responseData = json.encode(response.body);
     print(responseData);

     if(responseData.isNotEmpty){
       Fluttertoast.showToast(
           msg: "Form Submitted Successfully",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );

       if(responseData.contains(email.toString())){
         Fluttertoast.showToast(
             msg: "Email already in use",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0
         );
       }
     }
  }
  void checkPassword(){
    if(password.toString() != cpassword.toString()){
      Fluttertoast.showToast(
          msg: "Password not the same",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0 , horizontal:50.0 ),
        child: SingleChildScrollView(
          child: Form(
            key:  _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Surname'),
                    validator: (val) => val.isEmpty ? ' Enter your Surname' : null ,
                    onChanged :(val){
                      setState(() => surname = val);
                    }
                ),
                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                    validator: (val) => val.isEmpty ? ' Enter your First Name' : null ,
                    onChanged :(val){
                      setState(() => firstname = val);
                    }
                ),
                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
                    validator: (val) => val.isEmpty ? ' Enter your Phone Number' : null ,
                    onChanged :(val){
                      setState(() => phonenumber = val);
                    }
                ),

                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? ' Enter an email' : null ,
                    onChanged :(val){
                      setState(() => email = val);
                    }
                ),

                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Area of Residence'),
                    validator: (val) => val.isEmpty ? ' Enter your Area of Residence' : null ,
                    onChanged :(val){
                      setState(() => area = val);
                    }
                ),
                SizedBox(height: 10.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Nearest Landmark'),
                    validator: (val) => val.isEmpty ? ' Enter your Nearest Landmark' : null ,
                    onChanged :(val){
                      setState(() => landmark = val);
                    }
                ),

                SizedBox(height: 10.0,),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? ' Enter a password 6+ chars long' : null ,
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                    validator: (val) => val.length < 6 ? ' Enter a password 6+ chars long' : null ,
                    obscureText: true,
                    onChanged: (val){
                      setState(() => cpassword = val);
                    }
                ),
                SizedBox(height: 20.0),
                RaisedButton (
                    padding: EdgeInsets.fromLTRB(130.0,15.0,130.0,15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.green[800],

                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                      ),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                          checkPassword();
                          createUser();

                      }
                    }),
                SizedBox(height: 10.0),

                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                SizedBox(height: 30.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        " Already have an account? "
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign in here ",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15.0,
                        ),
                      ),
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => SignIn()));
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
