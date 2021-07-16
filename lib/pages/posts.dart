import 'package:flutter/material.dart';
import 'package:mobtech/components/animateroute.dart';
import 'package:mobtech/components/drawer.dart';
import 'package:mobtech/pages/comments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Posts extends StatefulWidget {
  Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List posts = [
    {'name': "yasser", 'content': " عندي جوال ايفون واريد ابعية لاعلى سعر "},
    {
      'name': "mohammed",
      'content': " عندي جوال ايفون ١٢ بور واريد ابعية لاعلى سعر "
    }
  ];
  var username;
  var email;
  getPrefSign() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
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
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
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
            for (int i = 0; i < posts.length; i++)
              ListPosts(
                  name: posts[i]['name'], contentpost: posts[i]['content']),
          ],
        ),
      ),
    );
  }
}

class ListPosts extends StatelessWidget {
  final name;
  final contentpost;

  const ListPosts({this.name, this.contentpost});
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
              subtitle: Text(
                contentpost,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
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
                      Navigator.of(context)
                          .push(SlideBottomRoute(page: Commments()));
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
