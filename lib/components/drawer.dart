import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isSignIn = false;

  getPrefSign() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    email = preferences.getString("email");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPrefSign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: isSignIn ? Text(username) : Text(""),
            accountEmail: isSignIn ? Text(email) : Text(""),
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
          isSignIn
              ? ListTile(
                  title: Text(
                    "المنشورات",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading: Icon(Icons.category, color: Colors.blue, size: 25),
                  onTap: () {
                    Navigator.of(context).pushNamed('r_posts');
                  },
                )
              : SizedBox(
                  height: 0,
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
          isSignIn
              ? ListTile(
                  title: Text(
                    "تسجيل الخروج",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading:
                      Icon(Icons.login_outlined, color: Colors.blue, size: 25),
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.remove("username");
                    preferences.remove("email");
                    preferences.remove("password");
                    Navigator.of(context).pushNamed("r_login");
                  },
                )
              : ListTile(
                  title: Text(
                    "تسجيل دخول",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  leading:
                      Icon(Icons.login_outlined, color: Colors.blue, size: 25),
                  onTap: () {
                    Navigator.of(context).pushNamed("r_login");
                  },
                ),
        ],
      ),
    );
  }
}
