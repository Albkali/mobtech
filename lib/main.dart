import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final List<String> imgList = [
  //   'assets/images/1.jpeg',
  //   'assets/images/2.jpeg',
  //   'assets/images/3.jpeg',
  //   'assets/images/4.jpeg',
  //   'assets/images/5.jpeg',
  //   'assets/images/6.jpeg',
  //   'assets/images/7.jpeg',
  //   'assets/images/8.jpeg',
  // ];

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
          body: ListView(
            children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      'assets/images/1.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/2.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/3.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/4.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/6.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/7.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/8.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ],
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 8.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotSpacing: 30,
                  dotVerticalPadding: 7.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  // borderRadius: true,
                  // radius: Radius.circular(200),
                  // overlayShadow: true,
                  // overlayShadowColors: Colors.blue,
                  // overlayShadowSize: 3,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  " الاقسام",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
              ),
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/1.png',
                          height: 90,
                          width: 90,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Apple",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/2.png',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Samsung",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/3.png',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Xiaomi",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/4.jpg',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Huawei",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/5.png',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Lg",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/6.png',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Lenovo",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'assets/categories/7.jpg',
                          height: 80,
                          width: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Vivo",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  " اخر المنتجات",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
              ),
              Container(
                  height: 400,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 5),
                    children: <Widget>[
                      GridTile(
                        child: Image.asset('assets/products/1.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "iPhone 12 pro Max",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Image.asset('assets/products/2.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "iPhone 12 Pro",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Image.asset('assets/products/3.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "SAMSUNG P30s PRO",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Image.asset('assets/products/4.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "SAMSUNG P30s ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Image.asset('assets/products/5.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "SAMSUNG P9s",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Image.asset('assets/products/6.jpeg'),
                        footer: Container(
                          height: 20,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              "iPhone 12 Pro",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
