import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen128/shared/custom_app_bar.dart';
import 'package:gen128/shared/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:gen128/homepage/all_reports.dart';
import 'package:like_button/like_button.dart';

class Posts extends StatefulWidget {
  final firstname;
  final surname;
  final picture;
  final email;
  final image;
  final name;
  final time;
  final headline;
  final location;
  final description;

  Posts({
    this.firstname,
    this.surname,
    this.picture,
    this.email,
    this.image,
    this.name,
    this.time,
    this.headline,
    this.location,
    this.description
});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List list;

  Future loadPosts() async{
    var url = "http://192.168.8.109/form/get_posts.php";
    var response = await http.get(url);
    var extracted= json.decode(response.body);
    return extracted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(firstname: widget.firstname, surname: widget.surname, email: widget.email,),
      body: FutureBuilder(
        future: loadPosts(),
        builder: (context,  snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.length ,
              itemBuilder: (context, index){
               list = snapshot.data;
               String description = list[index]['description'];
               String location = list[index]['location'];
               String date = list[index]['date'];
               String time = list[index]['time'];
               String name = list[index]['name'];
               String age = list[index]['age'];
               String sex = list[index]['sex'];
               String itemstolen = list[index]['itemstolen'];
               String headline = name + " aged " + age + ',' + " a " + sex + ', was rapped';
               if(name.isEmpty){
                 headline = itemstolen + " was stolen ";
               }

              return GestureDetector(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) =>
                  new AllReports(imageData: "http://192.168.8.109/form/img/${ list[index]['image'] }",
                                 nameData: list[index]['name'],
                                 locationData: location,
                                 descriptionData: description,
                                 timeData: time,
                                 dateData: date,
                                 headlineData: headline,
                  )));
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0) ,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start ,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                            headline,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        ),
                        SizedBox(height: 6.0),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              backgroundImage:new  NetworkImage("http://192.168.8.109/form/img/${ list[index]['image'] }"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                list[index]['name'],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(120.0, 0, 10,0),
                              child: Text(
                                  time
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              );
            }): Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}

