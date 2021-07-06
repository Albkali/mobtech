import 'package:flutter/material.dart';

class MobileDetails extends StatefulWidget {
  final name_d;
  final screen_d;
  final screen_protect_d;
  final screen_res_d;
  final system_d;
  final cpu_d;
  final num_core_d;
  final gpu_d;
  final memory_d;
  final ram_d;
  final battery_d;
  final camera_main_d;
  final camera_feature_d;
  final camera_video_d;
  final camera_ultra_d;
  final camera_tele_d;
  final camera_depth_d;
  final camera_micro_d;
  final camera_self_d;
  final camera_self_feature_d;
  final camera_self_video_d;
  final price_eg_d;
  final price_sa_d;
  final price_uae_d;
  final price_jo_d;
  final price_sy_d;
  final price_alg_d;
  final mob_cat_d;

  MobileDetails(
      {this.name_d,
      this.screen_d,
      this.screen_protect_d,
      this.screen_res_d,
      this.system_d,
      this.cpu_d,
      this.num_core_d,
      this.gpu_d,
      this.memory_d,
      this.ram_d,
      this.battery_d,
      this.camera_main_d,
      this.camera_feature_d,
      this.camera_video_d,
      this.camera_ultra_d,
      this.camera_tele_d,
      this.camera_depth_d,
      this.camera_micro_d,
      this.camera_self_d,
      this.camera_self_feature_d,
      this.camera_self_video_d,
      this.price_eg_d,
      this.price_sa_d,
      this.price_uae_d,
      this.price_jo_d,
      this.price_sy_d,
      this.price_alg_d,
      this.mob_cat_d});

  @override
  _MobileDetailsState createState() => _MobileDetailsState();
}

class _MobileDetailsState extends State<MobileDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('التفاصيل'),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              child: GridTile(
                child: Image.asset("assets/images/products/1.jpeg"),
                footer: Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  color: Colors.black.withOpacity(0.3),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.name_d,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          "${widget.price_sa_d}\$",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "المواصفات",
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  mySpec(context, "الموديل : ", widget.name_d, Colors.white,
                      Colors.blue),
                  mySpec(context, "الشاشة : ", widget.screen_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "الحمايات : ", widget.screen_protect_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "دقة الشاشة : ", widget.screen_res_d,
                      Colors.blue, Colors.white),
                  mySpec(context, "نظام التشغيل  : ", widget.system_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "المعالج : ", widget.cpu_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "المعالج الرسومي : ", widget.cpu_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "الذاكرة : ", widget.memory_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "الرام : ", widget.ram_d, Colors.white,
                      Colors.blue),
                  mySpec(context, "البطارية : ", widget.battery_d, Colors.blue,
                      Colors.white),

                  Container(
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: Text(
                      "الكاميرات",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  mySpec(context, "الموديل : ", widget.name_d, Colors.white,
                      Colors.blue),
                  mySpec(context, "الشاشة : ", widget.screen_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "الحمايات : ", widget.screen_protect_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "دقة الشاشة : ", widget.screen_res_d,
                      Colors.blue, Colors.white),
                  mySpec(context, "نظام التشغيل  : ", widget.system_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "المعالج : ", widget.cpu_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "المعالج الرسومي : ", widget.cpu_d,
                      Colors.white, Colors.blue),
                  mySpec(context, "الذاكرة : ", widget.memory_d, Colors.blue,
                      Colors.white),
                  mySpec(context, "الرام : ", widget.ram_d, Colors.white,
                      Colors.blue),
                  mySpec(context, "البطارية : ", widget.battery_d, Colors.blue,
                      Colors.white),

                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   padding: EdgeInsets.all(10),
                  //   color: Colors.white,
                  //   child: RichText(
                  //     text: TextSpan(
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: "الموديل : ",
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: "iphone 12 pro",
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               color: Colors.blue.withOpacity(0.7)),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   padding: EdgeInsets.all(10),
                  //   color: Colors.blue.withOpacity(0.5),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: "الشاشة : ",
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: "Super Amuled 5.5",
                  //           style: TextStyle(fontSize: 18, color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  mySpec(
      context, String feature, String details, Color colorbg, Color colortext) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: colorbg.withOpacity(0.5),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: feature,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: details,
              style: TextStyle(fontSize: 18, color: colortext.withOpacity(0.7)),
            )
          ],
        ),
      ),
    );
  }
}
