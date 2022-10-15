import 'package:flutter/material.dart';

import 'detail.dart';

void main() => runApp(const FashionApp());

class FashionApp extends StatelessWidget {
  const FashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  var tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.black,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.more,
                color: Colors.grey,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.navigation,
                color: Colors.black,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.grey,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Fashion App",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          // profil listesi
          Container(
            padding: EdgeInsets.all(10),
            height: 130,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                listMember('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                listMember('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                listMember('assets/model3.jpeg', 'assets/chloelogo.png'),
                listMember('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                listMember('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                listMember('assets/model3.jpeg', 'assets/chloelogo.png'),
              ],
            ),
          ),

          //Card
          cardWidget(
              'Daisy',
              '34 mins ago',
              '1.7k',
              "325",
              "2.3k",
              'assets/model1.jpeg',
              'assets/modelgrid1.jpeg',
              'assets/modelgrid2.jpeg',
              'assets/modelgrid3.jpeg',
              'This official website features a ribbed zipper jacket that is'
                  "modern and stylish. It  looks very temparament and is recommend to friends"),
        ],
      ),
    );
  }

  Widget cardWidget(
      String name,
      String time,
      String shared,
      String comment,
      String liked,
      String model,
      String imgGrid1,
      String imgGrid2,
      String imgGrid3,
      String post) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: Container(
          height: 500,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(model), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.more_vert, color: Colors.grey, size: 22)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                post,
                style: TextStyle(
                    fontSize: 13, fontFamily: 'Montserrat', color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    child: Hero(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage(imgGrid1), fit: BoxFit.cover),
                        ),
                      ),
                      tag: imgGrid1,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detail(imgPath: imgGrid1)));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Detail(imgPath: imgGrid2)));
                        },
                        child: Hero(
                          tag: imgGrid2,
                          child: Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width / 2 - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(imgGrid2),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Detail(imgPath: imgGrid3)));
                        },
                        child: Hero(
                          tag: imgGrid3,
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2 - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(imgGrid3),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.brown.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Text(
                        '#Louis vitton',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.brown.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Text(
                        '#Chloe',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.reply,
                    color: Colors.brown.withOpacity(0.2),
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    shared,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(
                    Icons.comment,
                    color: Colors.brown.withOpacity(0.2),
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    comment,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          liked,
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget listMember(String imagePath, String logoPath) {
  return Row(
    children: [
      Column(
        children: [
          Stack(
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(logoPath), fit: BoxFit.contain),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.brown,
            ),
            child: Center(
              child: Text(
                'Follow',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}
