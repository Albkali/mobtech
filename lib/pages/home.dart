import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:mobtech/components/drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
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
    return Directionality(
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
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250.0,
              width: double.infinity,
              child: Carousel(
                images: [
                  Image.asset(
                    'assets/images/posts/1.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/2.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/3.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/4.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/6.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/7.jpeg',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/posts/8.jpeg',
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
                        'assets/images/categories/1.png',
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
                        'assets/images/categories/2.png',
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
                        'assets/images/categories/3.png',
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
                        'assets/images/categories/4.jpg',
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
                        'assets/images/categories/5.png',
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
                        'assets/images/categories/6.png',
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
                        'assets/images/categories/7.jpg',
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
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/1.jpeg'),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/2.jpeg'),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/3.jpeg'),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/4.jpeg'),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/5.jpeg'),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: GridTile(
                        child: Image.asset('assets/images/products/6.jpeg'),
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
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
