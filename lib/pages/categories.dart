import 'package:flutter/material.dart';
import 'package:mobtech/components/drawer.dart';

class categories extends StatefulWidget {
  categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الاقسام"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('r_apple');
              },
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Apple",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/2.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Samsung",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/3.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Xiaomi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/4.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Huawei",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/5.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lg",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/6.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lenovo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/categories/7.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Vivo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
