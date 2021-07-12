import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  // LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool showsingin = true;

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

  GlobalKey<FormState> formStateSignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formStateSignup = new GlobalKey<FormState>();

  // String validusername(var val) {
  //   if (val.isEmpty) {
  //     return "يجب ادخال اسم المستخدم";
  //   }
  //   if (val.length < 4) {
  //     return "يجب ان بكون اسم المستخدم على الاقل اربعة احرف";
  //   } else {
  //     return "";
  //   }
  // }
  validusername(String? value) {
    if (value == null || value.trim().length == 0) {
      return "Field is required";
    }
    return null;
  }

  SigninValidate() {
    if (formStateSignin.currentState != null &&
        formStateSignin.currentState!.validate()) {
      print("done");
      Signin();
    } else {
      print("not done ");
    }
    // var formdata = formStateSignin.currentState;
    // // formdata!.save();
    // if (formdata != null && formdata!.validate()) {
    //   // Signin();
    // } else {
    //   print("not validate");
    // }
  }

  SignupVlidate() {
    if (formStateSignup.currentState != null &&
        formStateSignup.currentState!.validate()) {
      print("done");
      Signup();
    } else {
      print("not done ");
    }
  }

  Signin() async {
    var data = {"email": email.text, "password": password.text};
    var url = "http://127.0.0.1/mobtech/login.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == 'success') {
      print(responsebody['username']);
    } else {
      print("faild login");
    }
  }

  Signup() async {
    var data = {
      "email": email.text,
      "password": password.text,
      "username": username.text
    };
    var url = "http://127.0.0.1/mobtech/signup.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == 'success') {
      print('signup success');
    }
    if (responsebody['status'] == 'email-already-found') {
      print("email already has account");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  changeSignin() {
    setState(() {
      showsingin = !showsingin;
      // print(showsingin);
    });
  }

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
            Container(
              height: 1000,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Text(
                          showsingin ? "تسجيل دخول" : "انشاء حساب",
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
                    buildContainerAvatar(mdw),
                    showsingin
                        ? buildFormBoxLogin(mdw)
                        : buildFormBoxSignup(mdw),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center buildFormBoxLogin(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 40),
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
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Form(
            key: formStateSignin,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormFieldemail(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormFieldpassword(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                        backgroundColor: Colors.amber,
                        // minimumSize: Size(88, 36),
                        textStyle: TextStyle(fontSize: 18),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      onPressed: () {
                        SigninValidate();
                      },
                      child: Text(
                        "تسجيل الدخول",
                        // style: TextStyle(
                        //   fontSize: 20,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Container(
                      // color: Colors.red,
                      height: 30,
                      width: mdw,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              child: Text(
                                "نسيت كلمة السر",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Text(
                                "انشاء حساب",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                changeSignin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center buildFormBoxSignup(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 40),
        height: 380,
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
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Form(
            key: formStateSignup,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormFieldusername(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormFieldemail(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormFieldpassword(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormFieldconfirmpassword(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                        backgroundColor: Colors.amber,
                        // minimumSize: Size(88, 36),
                        textStyle: TextStyle(fontSize: 18),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      onPressed: () {
                        SignupVlidate();
                      },
                      child: Text(
                        "انشاء حساب ",
                        // style: TextStyle(
                        //   fontSize: 20,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 8, 0),
                    child: Container(
                      // color: Colors.red,
                      height: 30,
                      width: mdw,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              child: Text(
                                "سياسة الخصوصية",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                changeSignin();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField TextFormFieldemail() {
    return TextFormField(
      controller: email,
      obscureText: false,
      validator: (String? value) {
        if (value == null || value.trim().length == 0) {
          return "يجب ادخال البريد الالكتروني";
        } else if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return "ادخل الايميل بشكل صحيح";
        }
        return null;
      },
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.red,
      cursorWidth: 4,
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        // hintText = " ادخل الاسم ",
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.email,
            size: 20,
          ),
        ),
        labelText: "البريد الالكتروني",
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
    );
  }

  TextFormField TextFormFieldusername() {
    return TextFormField(
      controller: username,
      obscureText: false,
      validator: (String? value) {
        if (value!.trim().isEmpty || value.trim().length <= 0) {
          return "يجب ادخال اسم مستخدم";
        } else if (value.trim().length < 4) {
          return "يجب ان يكون اسم المستخدم على الاقل 4 احرف";
        } else if (value.trim().length > 15) {
          return "يجب ان يكون اسم المستخدم  اقل من 15 حرف";
        }
        // else if (!RegExp(r'^[a-z]+$').hasMatch(value)) {
        //   return " ادخل اسم المستخدم بشكل صحيح او بدون مسافات";
        // }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.red,
      cursorWidth: 4,
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        // hintText = " ادخل الاسم ",
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.person,
            size: 20,
          ),
        ),
        labelText: "اسم المستخدم",
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
    );
  }

  TextFormField TextFormFieldpassword() {
    return TextFormField(
      controller: password,
      obscureText: true,
      validator: (String? value) {
        if (value!.trim().isEmpty || value.trim().length <= 0) {
          return "يجب ادخال كلمة المرور";
        } else if (value.trim().length < 6) {
          return "يجب ان لا تكون كلمة المرور اقل من 6";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.red,
      cursorWidth: 4,
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        // hintText = " ادخل الاسم ",
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.lock,
            size: 20,
          ),
        ),
        labelText: "كلمة المرور",
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
    );
  }

  TextFormField TextFormFieldconfirmpassword() {
    return TextFormField(
      controller: confirmpassword,
      obscureText: true,
      validator: (String? value) {
        if (value!.trim() != password.text) {
          return "كلمة السر غير متطابقة";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.red,
      cursorWidth: 4,
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        // hintText = " ادخل الاسم ",
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.lock,
            size: 20,
          ),
        ),
        labelText: "تأكيد كملة المرور",
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
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOutBack,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: showsingin ? Colors.amber : Colors.grey,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            showsingin = !showsingin;
          });
        },
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
    );
  }

  Positioned buildPositionedTop(double mdw) {
    return Positioned(
      child: Transform.scale(
        scale: 1.2,
        child: Transform.translate(
          offset: Offset(0, -mdw / 1.7),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOutBack,
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: showsingin ? Colors.grey[800] : Colors.blue,
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOutBack,
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mdw),
            color: showsingin
                ? Colors.blue[800]!.withOpacity(0.5)
                : Colors.amber[800]!.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
