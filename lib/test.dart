import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  File? _file;

  Future pickerCamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  Future uploadPhoto() async {
    if (_file == null) {
      return;
    } else {
      String base64 = base64Encode(_file!.readAsBytesSync());
      String imagename = _file!.path.split("/").last;
      var data = {"imagename": imagename, "image64": base64};
      var url = "http://127.0.0.1/mobtech/uploadimage.php";
      var response = await http.post(Uri.parse(url), body: data);

      // var responsebody = jsonDecode(response.body);
    }
  }

  // Future getdata() async {
  //   var url = "https://jsonplaceholder.typicode.com/posts";
  //   // var url = Uri.https(
  //   //     'www.jsonplaceholder.typicode.com', '/posts', {'q': '{http}'});
  //   var response = await http.get(Uri.parse(url));
  //   var responsebody = jsonDecode(response.body);
  //   return responsebody;
  // }

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
          body: Column(
            children: [
              TextButton(
                onPressed: pickerCamera,
                child: Text("get photo"),
              ),
              Center(
                child: _file == null
                    ? Text("Image not selected")
                    : Image.file(_file!),
              ),
              TextButton(
                onPressed: uploadPhoto,
                child: Text("upload photo"),
              ),
            ],
          )
          // FutureBuilder(
          //   future: getdata(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         itemCount: snapshot.data.length,
          //         itemBuilder: (BuildContext context, int i) {
          //           return Container(
          //             child: Text(
          //               snapshot.data[i]['title'],
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),
          ),
    );
  }
}
