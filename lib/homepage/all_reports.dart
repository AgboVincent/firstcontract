import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


class AllReports extends StatefulWidget {
   final imageData;
   final nameData;
   final timeData;
   final dateData;
   final headlineData;
   final locationData;
   final descriptionData;

  AllReports({
     this.imageData,
     this.nameData,
     this.timeData,
     this.dateData,
     this.headlineData,
     this.locationData,
     this.descriptionData
  });


  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Header 2'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  "${widget.headlineData}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${widget.nameData}"),
                  Text(" ${widget.locationData} "),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("${widget.dateData}"),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right:20),
                        child: Text("${widget.timeData}"),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                height: 300,
                width: 200,
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(widget.imageData),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                    "${widget.descriptionData}"
                ),
              ),
              Container(
                color: Colors.green[800],
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            child: LikeButton(
                                size: 20,
                                likeCount: 0,
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.thumb_up,
                                    color: isLiked ? Colors.white : Colors.grey,
                                    size: 20,
                                  );
                                },
                                countBuilder:
                                    (int count, bool isLiked, String text) {
                                  var color =
                                      isLiked ? Colors.white : Colors.white;
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
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[

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
                              countBuilder:
                                  (int count, bool isLiked, String text) {
                                var color =
                                    isLiked ? Colors.white : Colors.white;
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
                              }),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
