import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Mobtech",
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mobtech"),
            backgroundColor: Colors.blue,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            centerTitle: true,
            elevation: 30,
            // leading: IconButton(onPressed: () {},icon: Icon(Icons.search)),
            brightness: Brightness.dark,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Yasser Albkali"),
                  accountEmail: Text("Yasser.Albkali@gmail.com"),
                  currentAccountPicture:
                      CircleAvatar(child: Icon(Icons.person)),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://miro.medium.com/max/1200/1*zH86wd-3URNeM_MoeaBQuQ.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "الصفحة الرئيسية",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading: Icon(Icons.home, color: Colors.blue, size: 25),
                  onTap: () {},
                  // trailing: Icon(Icons.hot_tub),
                  // subtitle: Text("yaya"),
                  // isThreeLine: true,
                  // dense: true,
                  // contentPadding: EdgeInsets.all(10),
                ),
                ListTile(
                  title: Text(
                    "الاقسام",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading: Icon(Icons.category, color: Colors.blue, size: 25),
                  onTap: () {},
                ),
                Divider(color: Colors.blue, height: 10, thickness: 0.1),
                ListTile(
                  title: Text(
                    "حول الجوال",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading: Icon(Icons.info, color: Colors.blue, size: 25),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "الاعدادات",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading: Icon(Icons.settings, color: Colors.blue, size: 25),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "تسجيل الخروج",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading:
                      Icon(Icons.login_outlined, color: Colors.blue, size: 25),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 8.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  images: [
                    Image.asset(
                      'assets/images/slider_1.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/slider_2.png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/slider_3.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
