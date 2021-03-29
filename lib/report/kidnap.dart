import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Kidnap(),
    );
  }
}

class Kidnap extends StatefulWidget {
  @override
  _KidnapState createState() => _KidnapState();
}

TextEditingController victimName = TextEditingController();
TextEditingController age= TextEditingController();
TextEditingController sex = TextEditingController();
TextEditingController facialMarks = TextEditingController();
TextEditingController spokenLanguages = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController location = TextEditingController();
class _KidnapState extends State<Kidnap> {
  DateTime _date = DateTime.now();
  Future<Null>selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date){
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;

  Future<Null> selectTime (BuildContext context) async{
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    setState(() {
      _time=picked;
      print(_time);
    });
  }

  File image;
  //Open gallery
  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = choosedimage;
    });
  }

  Future uploadImage() async {
    final uri = Uri.parse('http://192.168.8.101/form/crud_post.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = victimName.text;
    request.fields['age'] = age.text;
    request.fields['sex'] = sex.text;
    request.fields['facialMarks'] = facialMarks.text;
    request.fields['spokenLanguages'] = spokenLanguages.text;
    request.fields['description'] = description.text;
    request.fields['location'] = location.text;
    request.fields['date'] = _date.toString();
    request.fields['time'] = _time.toString();

    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('image uploaded');
    } else {
      print('image not uploaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kidnap"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,0,0.0),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.redAccent),
                title: Text("Victims Details"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
                controller: victimName,
                decoration: InputDecoration(
                  fillColor: Colors.green[100],
                  filled: true,
                   hintText: "Victims Name",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width:5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.pink, width:2.0 )
                  ),
                  //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color:Colors.red, size: 20,),
                    onPressed: (){
                      victimName.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
                controller: age,
                decoration: InputDecoration(
                  fillColor: Colors.green[100],
                  filled: true,
                  hintText: "Age",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width:5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.pink, width:2.0 )
                  ),
                  //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color:Colors.red, size: 20,),
                    onPressed: (){
                      age.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
                controller: sex,
                decoration: InputDecoration(
                  fillColor: Colors.green[100],
                  filled: true,
                  hintText: "Sex",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width:5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.pink, width:2.0 )
                  ),
                  //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color:Colors.red, size: 20,),
                    onPressed: (){
                      sex.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
                controller: facialMarks,
                decoration: InputDecoration(
                  fillColor: Colors.green[100],
                  filled: true,
                  hintText: "Facial Marks",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width:5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.pink, width:2.0 )
                  ),
                  //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color:Colors.red, size: 20,),
                    onPressed: (){
                      facialMarks.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: TextFormField(
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
                controller: spokenLanguages,
                decoration: InputDecoration(
                  fillColor: Colors.green[100],
                  filled: true,
                  hintText: "Spoken Languages",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.white, width:5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.pink, width:2.0 )
                  ),
                  //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color:Colors.red, size: 20,),
                    onPressed: (){
                      spokenLanguages.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,0,0.0),
              child: ListTile(
                leading: Icon(Icons.description, color: Colors.redAccent),
                title: Text("Description"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: Container(

                child: TextFormField(
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  controller: description,
                  maxLines: 5,
                  decoration: InputDecoration(
                    fillColor: Colors.green[100],
                    filled: true,
                    //  hintText: "item(s) Stolen",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.white, width:5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.pink, width:2.0 )
                    ),
                    //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color:Colors.red,size: 20,),
                      onPressed: (){
                        description.clear();
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,0,0.0),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.redAccent),
                title: Text("Location"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: Container(
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  controller: location,
                  decoration: InputDecoration(
                    fillColor: Colors.green[100],
                    filled: true,
                    //  hintText: "item(s) Stolen",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.white, width:5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.pink, width:2.0 )
                    ),
                    //prefixIcon: Icon(Icons.high_quality,color: Colors.redAccent,size: 20.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_drop_down, color:Colors.red, size: 25,),
                      onPressed: (){
                        location.clear();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10,20,0),
              child: RaisedButton.icon(
                onPressed: () {
                  chooseImage();
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: Colors.green[100],
                icon: Icon(Icons.perm_media,color: Colors.redAccent,),
                label: Text("Attachments",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Container(
                      height: 200,
                      width: 200,
                      child: image == null
                          ? Text('No Image Selected')
                          : Image.file(image)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,10,20,0),
              child: RaisedButton.icon(
                onPressed: () {
                  selectDate(context);
                  selectTime(context);
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: Colors.green[100],
                icon: Icon(Icons.date_range,color: Colors.redAccent,),
                label: Text("Date and Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    elevation: 2.0,
                    onPressed: (){
                      uploadImage();
                    },
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Publish",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
