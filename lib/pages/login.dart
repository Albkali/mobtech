import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // color: Colors.red,
              height: double.infinity,
              width: double.infinity,
            ),
            buildPositionedTop(mdw),
            buildPositionedBottom(mdw),
            buildContainerAvatar(mdw),
            Center(
              child: Container(
                height: 250,
                width: mdw / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            cursorColor: Colors.red,
                            cursorWidth: 4,
                            style: TextStyle(fontSize: 20, color: Colors.red),
                            decoration: InputDecoration(
                              // hintText = " ادخل الاسم ",
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.supervisor_account,
                                  size: 30,
                                ),
                              ),
                              labelText: " اسم المستخدم",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            cursorColor: Colors.amber,
                            cursorWidth: 4,
                            style: TextStyle(fontSize: 20, color: Colors.amber),
                            decoration: InputDecoration(
                              // hintText = " ادخل الاسم ",
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.password,
                                  size: 30,
                                ),
                              ),
                              labelText: "كلمة السر",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerAvatar(double mdw) {
    return Container(
      height: mdw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  "تسجيل دخول",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 10, spreadRadius: 5),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(
                      Icons.person_outline,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 65,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildPositionedTop(double mdw) {
    return Positioned(
      child: Transform.scale(
        scale: 1.2,
        child: Transform.translate(
          offset: Offset(0, -mdw / 1.7),
          child: Container(
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
      top: 350,
      right: mdw / 1.7,
      child: Transform.scale(
        scale: 1,
        child: Container(
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mdw),
            color: Colors.blue[800]!.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
//  Container(
//               padding: EdgeInsets.all(10),
//               child: Form(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       cursorColor: Colors.red,
//                       cursorWidth: 4,
//                       style: TextStyle(fontSize: 20, color: Colors.red),
//                       decoration: InputDecoration(
//                         // hintText = " ادخل الاسم ",
//                         contentPadding: EdgeInsets.all(15),
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefixIcon: Padding(
//                           padding: EdgeInsets.only(right: 20),
//                           child: Icon(
//                             Icons.supervisor_account,
//                             size: 40,
//                           ),
//                         ),
//                         labelText: "ادخل الاسم",
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(40),
//                           borderSide: BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(40),
//                           borderSide: BorderSide(
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
