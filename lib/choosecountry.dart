import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCountry extends StatefulWidget {
  ChooseCountry({Key? key}) : super(key: key);

  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  savePrefcounrty(String counrty) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("country", counrty);
    print(preferences.getString("country"));
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var country = preferences.getString("country");
    if (country != null) {
      Navigator.of(context).pushNamed('r_home');
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('اختر البلد'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                getListTile("السعودية", "sa", "sa"),
                getListTile("مصر", "eg", "eg"),
                getListTile("الامارات", "ae", "ae"),
                getListTile("الاردن", "jo", "jo"),
                getListTile("سوريا", "sy", "sy"),
                getListTile("الجزائر", "dz", "dz"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getListTile(String countrytitle, String icon_flog, String set_country) {
    return ListTile(
      title: Text(countrytitle),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('icons/flags/png/${icon_flog}.png',
                  package: 'country_icons'),
              fit: BoxFit.fill),
        ),
      ),
      onTap: () {
        savePrefcounrty(set_country);
        Navigator.of(context).pushNamed('r_login');
      },
    );
  }
}
