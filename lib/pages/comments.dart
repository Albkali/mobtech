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
                                decoration: InputDecoration(
                                  hintText: "  اكتب تعليقك هنا",
                                  suffixIcon: IconButton(
                                    onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
