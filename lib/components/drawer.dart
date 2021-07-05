import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Yasser Albkali"),
            accountEmail: Text("Yasser.Albkali@gmail.com"),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
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
            onTap: () {
              Navigator.of(context).pushNamed('r_home');
            },
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
            onTap: () {
              Navigator.of(context).pushNamed('r_categories');
            },
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
            leading: Icon(Icons.login_outlined, color: Colors.blue, size: 25),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
