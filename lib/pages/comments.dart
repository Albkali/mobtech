import 'package:flutter/material.dart';

class Commments extends StatefulWidget {
  Commments({Key? key}) : super(key: key);

  @override
  _CommmentsState createState() => _CommmentsState();
}

class _CommmentsState extends State<Commments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
            child: Text(
          "Comments",
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
