import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//Creating a class user to store the data;
class User {
  final String id;
  final String surname;
  final String firstname;
  final String phonenumber;
  final String email;
  final String area;
  final String landmark;
  final String password;
  final String cpassword;

  User({
    this.id,
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    var url = Uri.parse("http://192.168.0.146/form/get_user.php");
    final response = await http.get(url);

    var responseData = json.decode(response.body);
    print(responseData);

   // Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          surname: singleUser["surname"],
          firstname: singleUser["firstname"],
          phonenumber: singleUser["phonenumber"],
          email: singleUser["email"],
          area: singleUser["area"],
          landmark: singleUser["landmark"],
          password: singleUser["password"],
          cpassword: singleUser["cpassword"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) {
                    User user = snapshot.data[index];
                        return Column(
                         children: <Widget>[
                           Text('${user.surname}',
                             style: TextStyle(
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.green,
                             ),
                           ),
                           Text('${user.firstname}'),
                           Text('${user.phonenumber}'),
                           Text('${user.area}'),
                         ],
                        );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
