import 'package:flutter/material.dart';
import 'package:fluttermentoring/pages/tab_webview.dart';
import 'package:fluttermentoring/pages/tab_mapview.dart';
import 'package:fluttermentoring/pages/tab_videoview.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var _tabs = <Widget>[
    TabWebView(),
    TabMapView(),
    TabVideoView(),
  ];
  var _tabMenuItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.web),
      title: Text('WebView'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('Map'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.ondemand_video),
      title: Text('Video'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kProjectName),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabMenuItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          if(index < _tabMenuItems.length){
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
