import 'package:flutter/material.dart';
import 'package:gen128/homepage/profile.dart';
import 'package:gen128/report/armed_robbery.dart';
import 'package:gen128/report/civil_unrest.dart';
import 'package:gen128/report/fire_outbreak.dart';
import 'package:gen128/report/rape.dart';
import 'package:gen128/report/kidnap.dart';


class CustomDrawer extends StatefulWidget {
  final surname;
  final firstname;
  final email;
  final picture;

  CustomDrawer ({
    this.surname,
    this.firstname,
    this.email,
    this.picture
  });

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

enum Report { armedRobbery, rape, kidnap, civilUnrest, fireOutbreak }

class CustomDrawerState extends State<CustomDrawer> {
  Future<void> OpenDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("What kind of Report"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Report.armedRobbery);
                },
                child: const Text("Armed Robbery"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Report.rape);
                },
                child: const Text("Rape"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Report.kidnap);
                },
                child: const Text("Kidnap"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Report.civilUnrest);
                },
                child: const Text("Civil Unrest"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Report.fireOutbreak);
                },
                child: const Text("Fire Outbreak"),
              )
            ],
          );
        })) {
      case Report.armedRobbery:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArmedRobbery()));
        break;

      case Report.rape:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Rape()));
        break;

      case Report.kidnap:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Kidnap()));
        break;

      case Report.civilUnrest:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CivilUnrest()));
        break;

      case Report.fireOutbreak:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FireOutbreak()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: UserAccountsDrawerHeader(
                accountName: Text('${widget.surname}  ${widget.firstname}'),
                accountEmail: Text('${widget.email}'),
                currentAccountPicture: GestureDetector(
                  onTap: () {

                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: new NetworkImage("${widget.picture}"),
                      ),
                    ],
                  )
                ),
                decoration: BoxDecoration(color: Colors.green)),
          ),
          ListTile(
              leading: Icon(Icons.person, color: Colors.redAccent),
              title: Text('My Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                    return Profile();
                }));
              }),
          ListTile(
            leading: Icon(Icons.add_circle, color: Colors.redAccent),
            title: Text('Add Report'),
            onTap: () {
              OpenDialog();
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle, color: Colors.redAccent),
            title: Text('Add Report'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add_circle, color: Colors.redAccent),
            title: Text('Add Report'),
            onTap: () {},
          ),
          Divider(color: Colors.red, indent: 20.0),
          ListTile(
            //     leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Sign Up'),
            onTap: () {},
          ),
          ListTile(
            //    leading: Icon(Icons.help, color: Colors.green),
            title: Text('Login'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
