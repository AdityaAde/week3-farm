import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farm/view/Berita.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:farm/Widget/logout.dart';

import 'Galeri.dart';
import 'Kamus.dart';

class PageControl extends StatefulWidget {
  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  int currentIndex = 0;
  final List<Widget> _listMenu = [
    BeritaPage(),
    GaleriPage(),
    KamusPage(),
    LogOut()
  ];

  final iconList = <IconData>[
    Icons.book,
    Icons.list,
    Icons.search,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Farm's App"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: HexColor('#eeeeee'),
      body: _listMenu[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.tag_faces_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.white,
        backgroundColor: Colors.blue,
        icons: iconList,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
