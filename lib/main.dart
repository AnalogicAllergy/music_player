import 'dart:ui' as prefix0;
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = 0;
    _controller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                  image: AssetImage('assets/images/sia.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          title: Text(
            'Home',
            style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(height: 90, child: HeaderStories()),
              Container(
                height: 1,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width - 20,
              ),
              SizedBox(
                height: 15,
              ),
              MiddleBody(),
              BottomContent()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          items: [
            BottomNavyBarItem(
                activeColor: Colors.green,
                inactiveColor: Colors.black,
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavyBarItem(
                activeColor: Colors.green,
                inactiveColor: Colors.black,
                icon: Icon(
                  Icons.library_music,
                  color: Colors.grey,
                ),
                title: Text('Library', style: TextStyle(color: Colors.black))),
            BottomNavyBarItem(
                activeColor: Colors.green,
                inactiveColor: Colors.black,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text('Settings', style: TextStyle(color: Colors.black))),
          ],
          onItemSelected: (index) => setState(() {
                _index = index;
                _controller.animateTo(_index);
              }),
        ));
  }
}

Widget HeaderStories() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      ArtistStory('assets/images/ariana.jpg', 'Ariana Grande'),
      SizedBox(
        width: 5,
      ),
      ArtistStory('assets/images/dualipa.jpg', 'Dua Lipa'),
      SizedBox(
        width: 5,
      ),
      ArtistStory('assets/images/drake.jpg', 'Drake'),
      SizedBox(
        width: 5,
      ),
      ArtistStory('assets/images/eminem.jpg', 'Eminem'),
      SizedBox(
        width: 5,
      ),
      ArtistStory('assets/images/beatles.jpg', 'The Beatles'),
    ],
  );
}

Widget ArtistStory(String image, String name) {
  return Column(children: <Widget>[
    Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 30,
        foregroundColor: Colors.green,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      name,
      style: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: 'Poppins',
      ),
    )
  ]);
}

Widget MiddleBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Recently Uploaded',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins-Bold',
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            BuildMidContent('assets/images/back1.jpg', 'Best of 2018'),
            SizedBox(
              width: 10,
            ),
            BuildMidContent(
                'assets/images/7rings.jpg', '7 rings - Ariana Grande'),
            SizedBox(
              width: 10,
            ),
            BuildMidContent('assets/images/back1.jpg', 'Best of Rap'),
            SizedBox(
              width: 10,
            ),
            BuildMidContent('assets/images/back1.jpg', 'Best of Pop'),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      )
    ],
  );
}

Widget BuildMidContent(String image, String text) {
  return Container(
    height: 190,
    width: 170,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
            left: 20,
            top: 85,
            right: 30,
            child: Column(
              children: <Widget>[
                Text(text,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Container(
                  height: 2,
                  width: 20,
                  color: Colors.green,
                )
              ],
            ))
      ],
    ),
  );
}

Widget BottomContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'New Singles today',
        style: TextStyle(
            fontFamily: 'Poppins-Bold',
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      Container(
        padding: EdgeInsets.all(10),
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            BuildBottomContent('assets/images/cardi-b.jpg', 'Money - Cardi B'),
            SizedBox(
              width: 10,
            ),
            BuildBottomContent('assets/images/sia.jpg', 'Sia - Genius'),
            SizedBox(
              width: 10,
            ),
            BuildBottomContent('assets/images/billie.jpeg', 'Billie Ellish'),
            SizedBox(
              width: 10,
            ),
            BuildBottomContent('assets/images/rex.jpg', 'Rex Orange County'),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      )
    ],
  );
}

Widget BuildBottomContent(String image, String text) {
  return Container(
    height: 120,
    width: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 4,
        ),
        Text(text,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Colors.grey[700],
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
