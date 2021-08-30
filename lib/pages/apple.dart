import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobtech/components/drawer.dart';
import 'package:mobtech/components/mobList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Apple extends StatefulWidget {
  Apple({Key? key}) : super(key: key);

  @override
  _AppleState createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  var country_pref;
  // List mobilelist = [
  //   {
  //     'name': 'iPhone 12 pro',
  //     'camera': '12 ميجا بكسل',
  //     'cpu': 'ثماني النواة',
  //     'battery': '5000 mha',
  //     'price': '1500',
  //     'memory': '128GB',
  //   },
  //   {
  //     'name': 'iPhone 12 ',
  //     'camera': '8 ميجا بكسل',
  //     'cpu': 'رباعي النواة',
  //     'battery': '4000 mha',
  //     'memory': '64GB',
  //     'price': '1000',
  //   },
  //   {
  //     'name': 'iPhone 11 pro ',
  //     'camera': '8 ميجا بكسل',
  //     'cpu': 'ثماني النواة',
  //     'battery': '4500 mha',
  //     'memory': '64GB',
  //     'price': '1200',
  //   },
  // ];
  Future getdata() async {
    var url = "https://albkali.com/mobtech/apple.php";
    var data = {
      "cat": "5",
    };
    var response = await http.post(Uri.parse(url), body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      country_pref = preferences.getString("country");
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

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
        body: FutureBuilder(
            future: getdata(),
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
                      camera_self_feature: snapshot.data[i]
                          ['camera_self_feature'],
                      camera_self_video: snapshot.data[i]['camera_self_video'],
                      price_eg: snapshot.data[i]['price_eg'],
                      price_sa: snapshot.data[i]['price_sa'],
                      price_uae: snapshot.data[i]['price_uae'],
                      price_jo: snapshot.data[i]['price_jo'],
                      price_sy: snapshot.data[i]['price_sy'],
                      price_alg: snapshot.data[i]['price_alg'],
                      mob_cat: snapshot.data[i]['mob_cat'],
                      country: country_pref,
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
