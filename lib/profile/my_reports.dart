import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyReport extends StatefulWidget {
  @override
  _MyReportState createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
           margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0) ,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "Headline of the News and details goes here",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                ),
                SizedBox(height: 6.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3.0,20,0,10.0),
                      child: Text(
                          "Location"
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100.0, 20.0, 25,10.0),
                      child: Text(
                          "Time"
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.green[800],
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove_red_eye,color: Colors.white,size: 20),
                        onPressed: (){

                        },
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      ),
                     LikeButton(
                       size: 20,
                       likeCount: 0,
                       likeBuilder: (bool isLiked) {
                         return Icon(
                           Icons.thumb_up,
                           color: isLiked ? Colors.white : Colors.grey,
                           size: 20,
                         );
                       },
                         countBuilder: (int count, bool isLiked, String text) {
                          var color = isLiked ? Colors.white : Colors.white;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                         }
                     ),
                      LikeButton(
                          size: 20,
                          padding: const EdgeInsets.all(10.0),
                          likeCount: 0,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_down,
                              color: isLiked ? Colors.white : Colors.grey,
                              size: 20,
                            );
                          },
                          countBuilder: (int count, bool isLiked, String text) {
                            var color = isLiked ? Colors.white : Colors.white;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          }
                      ),
                      IconButton(
                        icon: Icon(Icons.message,color: Colors.white,size: 20,),
                        onPressed: (){

                        },
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete,color: Colors.white,size: 20,),
                        onPressed: (){
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.0),
              ],
            ),
          ),

      ),
    );
  }
}
