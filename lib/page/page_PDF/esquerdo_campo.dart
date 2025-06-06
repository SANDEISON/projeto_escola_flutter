import 'package:flutter/material.dart';

var defaultBackgroundColor = const Color.fromARGB(255, 221, 220, 220);
var appBarColor = const Color.fromARGB(255, 0, 0, 0);
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' Gerator PDF ',style: TextStyle(
  color: const Color.fromARGB(255, 70, 69, 69),)),
  centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: const Color.fromARGB(255, 23, 22, 22),
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: const Color.fromARGB(255, 113, 111, 111),
  elevation: 0,
  child: Column(
    children: [
      DrawerHeader(
        child: Icon(
          Icons.accessibility_new,
          size: 34,
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'D A S H B O A R D',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'A L U N O',
            style: TextStyle( color: const Color.fromARGB(255, 167, 25, 25),),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text(
            'A L U N O S',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'E V E N T O S',
            style: drawerTextColor,
          ),
        ),
      ),
    ],
  ),
);