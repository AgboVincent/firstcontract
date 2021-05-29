import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen128/shared/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:gen128/homepage/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UserInfo extends StatefulWidget {
  final surname;
  final firstname;
  final address;
  final phonenumber;
  final email;
  final picture;

   UserInfo ({this.surname,
    this.firstname,
    this.address,
    this.phonenumber,
    this.email,
    this.picture
  });
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  File image;
  //Open gallery
  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(choosedimage.path);
      uploadImage();
    });
  }

  Future uploadImage() async {
    final uri = Uri.parse('http://192.168.43.33/form/profile_pic.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = "${widget.email}";
    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('profile pic uploaded successfully');
    } else {
      print('profile pic not uploaded successfully');
    }
  }
  Future loadProfilePic() async{
    var url = Uri.parse( "http://192.168.8.109/form/get_user.php");
    var response = await http.get(url);
    var extracted= json.decode(response.body);
    return extracted;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      future: loadProfilePic(),
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            child: Center(
                              child:  IconButton(
                                iconSize: 30,
                               // padding: EdgeInsets.fromLTRB(65, 70, 10, 0),
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                 chooseImage();
                                },
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: SizedBox(
                              height: 100,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, index) {
                                  List user = snapshot.data;
                                  String name =user[index]['email'];
                                  String picture = "http://192.168.43.33/form/profile_pic/${user[index]['email']['profile_image']}";
                                  CustomDrawer(picture: picture,);
                                  return CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50.0,
                                    backgroundImage: new NetworkImage(picture),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 50, 80, 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${widget.surname}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${widget.firstname}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      '${widget.address}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      '${widget.phonenumber}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.email}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            ),
          )
      ),
    );
  }
}