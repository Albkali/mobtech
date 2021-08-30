import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:mobtech/components/animateroute.dart';
import 'package:mobtech/components/drawer.dart';
import 'package:mobtech/pages/comments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Posts extends StatefulWidget {
  Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var id;
  var username;
  var email;
  File? _file;
  TextEditingController _addpost = new TextEditingController();

  Future pickerCamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  Future addPost() async {
    String base64 = base64Encode(_file!.readAsBytesSync());
    String imagename = _file!.path.split("/").last;
    var data = {
      "post": _addpost.text,
      "postuser": id,
      "imagename": imagename,
      "image64": base64
    };
    var url = "https://albkali.com/mobtech/addpost.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    Navigator.of(context).pushNamed('r_posts');
    _addpost.text = "";
  }

  Future getPost() async {
    var url = "https://albkali.com/mobtech/post.php";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  getPrefSign() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id");
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
  }

  @override
  void initState() {
    getPrefSign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("منشورات"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: TextFormField(
                      controller: _addpost,
                      maxLines: 10,
                      minLines: 1,
                      maxLength: 255,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 15),
                        hintText: "اضف جوال للبيع",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: pickerCamera,
                    icon: Icon(Icons.camera_enhance),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            addPost();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "أضف منشور",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                Icon(
                                  Icons.add_box,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: getPost(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (int i = snapshot.data.length - 1; i >= 0; i--)
                        ListPosts(
                          name: snapshot.data[i]['username'],
                          contentpost: snapshot.data[i]['post'],
                          postId: snapshot.data[i]['post_id'],
                          postImage: snapshot.data[i]['post_image'],
                        ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListPosts extends StatelessWidget {
  final postId;
  final name;
  final contentpost;
  final postImage;

  ListPosts({this.postId, this.name, this.contentpost, this.postImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                trailing: Icon(Icons.more_vert),
                // isThreeLine: true,
                subtitle: Column(
                  children: [
                    Text(
                      contentpost,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Image.network(
                        "https://albkali.com/mobtech/upload/${postImage}"),
                  ],
                )),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "إعجاب",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(Icons.thumb_up, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "تعليق",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(Icons.comment, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   Comments.routeName,
                      //   arguments: Comments(
                      //     Idpost: postId,
                      //   ),
                      // );
                      // Navigator.of(context).push(
                      //   SlideBottomRoute(
                      //     page: Comments(
                      //       Idpost: postId,
                      //     ),
                      //   ),
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Comments(
                            Idpost: postId,
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
          ],
        ),
      ),
    );
  }
}
