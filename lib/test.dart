import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getdata() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    // var url = Uri.https(
    //     'www.jsonplaceholder.typicode.com', '/posts', {'q': '{http}'});
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  // @override
  // void initState() {
  //   getdata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    child: Text(
                      snapshot.data[i]['title'],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
