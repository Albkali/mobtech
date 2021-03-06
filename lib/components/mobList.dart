import 'package:flutter/material.dart';
import 'package:mobtech/pages/mobiledetails.dart';

class mobList extends StatelessWidget {
  var price;
  final country;
  final name;
  final screen;
  final screen_protect;
  final screen_res;
  final system;
  final cpu;
  final num_core;
  final gpu;
  final memory;
  final ram;
  final battery;
  final camera_main;
  final camera_feature;
  final camera_video;
  final camera_ultra;
  final camera_tele;
  final camera_depth;
  final camera_micro;
  final camera_self;
  final camera_self_feature;
  final camera_self_video;
  final price_eg;
  final price_sa;
  final price_uae;
  final price_jo;
  final price_sy;
  final price_alg;
  final mob_cat;

  mobList(
      {this.country,
      this.name,
      this.screen,
      this.screen_protect,
      this.screen_res,
      this.system,
      this.cpu,
      this.num_core,
      this.gpu,
      this.memory,
      this.ram,
      this.battery,
      this.camera_main,
      this.camera_feature,
      this.camera_video,
      this.camera_ultra,
      this.camera_tele,
      this.camera_depth,
      this.camera_micro,
      this.camera_self,
      this.camera_self_feature,
      this.camera_self_video,
      this.price_eg,
      this.price_sa,
      this.price_uae,
      this.price_jo,
      this.price_sy,
      this.price_alg,
      this.mob_cat});

  @override
  Widget build(BuildContext context) {
    if (country == "sa") {
      price = price_sa;
    } else if (country == "eg") {
      price = price_eg;
    } else if (country == "ae") {
      price = price_uae;
    } else if (country == "jo") {
      price = price_jo;
    } else if (country == "sy") {
      price = price_sy;
    } else if (country == "dz") {
      price = price_alg;
    }
    return InkWell(
      child: Container(
        height: 200,
        width: 100,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/products/3.jpeg'),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // alignment: Alignment.topRight,
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          name,
                          style: (TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "???????????????? : ",
                                  style: (TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                                ),
                                Text(
                                  camera_main,
                                  style: (TextStyle(
                                      color: Colors.blue, fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "?????????????? : ",
                            style:
                                (TextStyle(color: Colors.grey, fontSize: 16)),
                          ),
                          Text(
                            num_core,
                            style:
                                (TextStyle(color: Colors.blue, fontSize: 16)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "???????????????? : ",
                                  style: (TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                                ),
                                Text(
                                  battery,
                                  style: (TextStyle(
                                      color: Colors.blue, fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "?????????????? : ",
                            style:
                                (TextStyle(color: Colors.grey, fontSize: 16)),
                          ),
                          Text(
                            memory,
                            style:
                                (TextStyle(color: Colors.blue, fontSize: 16)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "?????????? : $price \$",
                                style: (TextStyle(
                                    color: Colors.red, fontSize: 20)),
                              ),
                            ),
                            // Text(
                            //   "???????????? ???????? ?????? ????????????????",
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
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MobileDetails(
              name_d: name,
              screen_d: screen,
              screen_protect_d: screen_protect,
              screen_res_d: screen_res,
              system_d: system,
              cpu_d: cpu,
              num_core_d: num_core,
              gpu_d: gpu,
              memory_d: memory,
              ram_d: ram,
              battery_d: battery,
              camera_main_d: camera_main,
              camera_feature_d: camera_feature,
              camera_video_d: camera_video,
              camera_ultra_d: camera_ultra,
              camera_tele_d: camera_tele,
              camera_depth_d: camera_depth,
              camera_micro_d: camera_micro,
              camera_self_d: camera_self,
              camera_self_feature_d: camera_self_feature,
              camera_self_video_d: camera_self_video,
              price_eg_d: price_eg,
              price_sa_d: price_sa,
              price_jo_d: price_jo,
              price_uae_d: price_uae,
              price_sy_d: price_sa,
              price_alg_d: price_alg,
              mob_cat_d: mob_cat,
            );
          }),
        );
      },
    );
  }
}
