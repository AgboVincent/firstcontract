import 'package:flutter/material.dart';
import 'package:gen128/homepage/emergency.dart';
import 'package:gen128/homepage/profile.dart';
import 'package:gen128/report/add_report.dart';
import 'package:gen128/report/posts.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  final surname;
  final firstname;
  final address;
  final phonenumber;
  final email;
  final picture;

  Home({
    this.surname,
    this.firstname,
    this.address,
    this.phonenumber,
    this.email,
    this.picture
  });

  @override
  _HomeState createState() => _HomeState();
}


enum addReport {armedRobbery, rape, kidnap, civilUnrest, fireOutbreak}
class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  Emergency emergency;
  Profile profile;
  Posts posts;
  AddReport report;
  List<Widget> pages;
  Widget currentPage;


  @override
  void initState() {
    emergency = Emergency();
    profile = Profile(surname: widget.surname, firstname: widget.firstname, address: widget.address,phonenumber: widget.phonenumber,
    email: widget.email, picture: widget.picture);
    posts = Posts(surname: widget.surname, firstname: widget.firstname, email:widget.email,);
    report = AddReport();

    pages = [posts, report, emergency, profile];
    currentPage = posts;
    super.initState();
  }

  void ItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      currentPage= pages[index];
      if(currentPage == pages[1]){
            //  OpenDialog();
        }
    });
  }
  Future<void> OpenDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("What kind of Report"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, addReport.armedRobbery);
                },
                child: const Text("Armed Robbery"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, addReport.rape);
                },
                child: const Text("Rape"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, addReport.kidnap);
                },
                child: const Text("Kidnap"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, addReport.civilUnrest);
                },
                child: const Text("Civil Unrest"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, addReport.fireOutbreak);
                },
                child: const Text("Fire Outbreak"),
              )
            ],
          );
        }
    )) {
      case addReport.armedRobbery:
        print("Rape Selected");
        break;

      case addReport.rape:
        print("Rape Selected");
        break;

      case addReport.kidnap:
        print("kidnap Selected");
        break;

      case addReport.civilUnrest:
        print("civil unrest Selected");
        break;

      case addReport.fireOutbreak:
        print("fire outbreak");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.highlight), title: Text("Add Report")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), title: Text("Emergency")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: ItemTapped,
        type : BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
      ),
    );
  }
}

