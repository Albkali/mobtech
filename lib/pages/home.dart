import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:mobtech/components/drawer.dart';
import 'package:mobtech/components/mobList.dart';
import 'package:mobtech/pages/mobiledetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var country;
  var listSearch = [];
  Future getDataSearch() async {
    var url = "https://albkali.com/mobtech/search.php";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listSearch.add(responsebody[i]['name']);
    }
  }

  @override
  void initState() {
    getDataSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobtech"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // _showDialog();
                showSearch(
                    context: context, delegate: DataSearch(list: listSearch));
              },
            ),
          ],
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: new Text("البحث")),
          content: Container(
              height: 100,
              child: Column(
                children: [
                  new Text("اكتب الذي تريد البحث عنه "),
                  TextFormField(
                    decoration: InputDecoration(hintText: "اكتب هنا"),
                  ),
                ],
              )),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("تم"),
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return MobileDetails();
                // },
                // ),
                // );
              },
            ),
            new TextButton(
              child: new Text("الغاء"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({required this.list});

  Future getDataResult() async {
    var data = {"searchmobile": query};
    var url = "https://albkali.com/mobtech/searchmob.php";
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: getDataResult(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return mobList(
                  name: snapshot.data[i]['name'],
                  screen: snapshot.data[i]['screen'],
                  screen_protect: snapshot.data[i]['screen_protect'],
                  screen_res: snapshot.data[i]['screen_res'],
                  system: snapshot.data[i]['system'],
                  cpu: snapshot.data[i]['cpu'],
                  num_core: snapshot.data[i]['num_core'],
                  gpu: snapshot.data[i]['gpu'],
                  memory: snapshot.data[i]['memory'],
                  ram: snapshot.data[i]['ram'],
                  battery: snapshot.data[i]['battery'],
                  camera_main: snapshot.data[i]['camera_main'],
                  camera_feature: snapshot.data[i]['camera_feature'],
                  camera_video: snapshot.data[i]['camera_video'],
                  camera_ultra: snapshot.data[i]['camera_ultra'],
                  camera_tele: snapshot.data[i]['camera_tele'],
                  camera_depth: snapshot.data[i]['camera_depth'],
                  camera_micro: snapshot.data[i]['camera_micro'],
                  camera_self: snapshot.data[i]['camera_self'],
                  camera_self_feature: snapshot.data[i]['camera_self_feature'],
                  camera_self_video: snapshot.data[i]['camera_self_video'],
                  price_eg: snapshot.data[i]['price_eg'],
                  price_sa: snapshot.data[i]['price_sa'],
                  price_uae: snapshot.data[i]['price_uae'],
                  price_jo: snapshot.data[i]['price_jo'],
                  price_sy: snapshot.data[i]['price_sy'],
                  price_alg: snapshot.data[i]['price_alg'],
                  mob_cat: snapshot.data[i]['mob_cat'],
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var listsearchfltr = query.isEmpty
        ? list
        : list
            .where((p) => p.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: listsearchfltr.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(
              Icons.mobile_screen_share,
            ),
            title: Text(listsearchfltr[i]),
            onTap: () {
              query = listsearchfltr[i];
              showResults(context);
            },
          );
        });
  }
}
