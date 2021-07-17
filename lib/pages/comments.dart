import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Comments extends StatefulWidget {
  // static const routeName = 'r_comments';
  final Idpost;
  Comments({this.Idpost});
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  var id;
  TextEditingController _addcomment = new TextEditingController();
  getPrefSign() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id");
    });
  }

  Future addComment() async {
    var data = {
      "comment": _addcomment.text,
      "comment_user": id,
      "comment_post": widget.Idpost
    };
    var url = "http://127.0.0.1/mobtech/addcomment.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    Navigator.of(context).pushNamed('r_posts');
    // _addcomment.text = "";
  }

  Future getComments() async {
    var data = {"postid": widget.Idpost};
    var url = "http://127.0.0.1/mobtech/comments.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);

    return responsebody;
  }

  @override
  void initState() {
    getPrefSign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      // color: Colors.red,
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_enhance_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: TextFormField(
                                    controller: _addcomment,
                                    decoration: InputDecoration(
                                      hintText: "  اكتب تعليقك هنا",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          addComment();
                                        },
                                        icon: Icon(Icons.send),
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                      filled: true,
                                      fillColor: Colors.grey[285],
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:
                                            BorderSide(style: BorderStyle.none),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:
                                            BorderSide(style: BorderStyle.none),
                                      ),
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.blue),
                                      //   borderRadius: BorderRadius.circular(30),
                                      // ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Toppositioned(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned Toppositioned() {
    return Positioned(
      top: 30,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 70,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getComments(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (int i = 0; i < snapshot.data.length; i++)
                      Commentslist(
                        comments: snapshot.data[i]['comment'],
                        username: snapshot.data[i]['username'],
                      )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Commentslist extends StatelessWidget {
  final username;
  final comments;

  Commentslist({this.username, this.comments});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 20),
        child: Text(username),
      ),
      subtitle: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[100],
        child: Text(comments),
      ),
    );
  }
}
