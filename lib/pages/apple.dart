import 'package:flutter/material.dart';
import 'package:mobtech/components/drawer.dart';

class Apple extends StatefulWidget {
  Apple({Key? key}) : super(key: key);

  @override
  _AppleState createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Apple"),
            centerTitle: true,
          ),
          drawer: MyDrawer(),
          body: ListView(
            children: [
              Container(
                height: 150,
                width: 100,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/products/1.jpeg'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topRight,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "المواصفات",
                                style: (TextStyle(fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "الكاميرا : ",
                                          style:
                                              (TextStyle(color: Colors.grey)),
                                        ),
                                        Text(
                                          "12 ميجا بكسل",
                                          style:
                                              (TextStyle(color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "المعالح : ",
                                        style: (TextStyle(color: Colors.grey)),
                                      ),
                                      Text(
                                        "ثماني النواة ",
                                        style: (TextStyle(color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "البطارية : ",
                                          style:
                                              (TextStyle(color: Colors.grey)),
                                        ),
                                        Text(
                                          "5000 MHA",
                                          style:
                                              (TextStyle(color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "الذاكرة : ",
                                        style: (TextStyle(color: Colors.grey)),
                                      ),
                                      Text(
                                        "64GB/32GB",
                                        style: (TextStyle(color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "السعر : 1200 \$",
                                        style: (TextStyle(
                                            color: Colors.red, fontSize: 18)),
                                      ),
                                    ),
                                    // Text(
                                    //   "للمزيد اضغظ على الموبايل",
                                    //   style: (TextStyle(
                                    //       color: Colors.red, fontSize: 14)),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
