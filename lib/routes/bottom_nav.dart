import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondnumber/constants.dart';
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/screens/bin/bin_screen.dart';
import 'package:secondnumber/screens/calls/call_screen.dart';
import 'package:secondnumber/screens/chats/chats_screen.dart';
import 'package:secondnumber/screens/settings/settings_screen.dart';
import 'package:secondnumber/screens/subscription/subscription_screen.dart';

import '../core/utils/image_constant.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();
}

class _MainBottomClassState extends State<MainBottomClass> {
  int selectedIndex = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();

  //list of widgets to call ontap
  final widgetOptions = [
    new CallScreen(),
    new ChatScreen(),
    new BinScreen(),
    new SettingScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Chat", "Status", "Call", ""];
  Widget customDrawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(

        // drawer: customDrawer(),
        body: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            Navigator(
              key: _page1,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => CallScreen(),
              ),
            ),
            Navigator(
              key: _page2,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => ChatScreen(),
              ),
            ),
            Navigator(
              key: _page3,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => BinScreen(),
              ),
            ),
            Navigator(
              key: _page4,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => SettingScreen(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: currentIndex == 0
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(color: kgrey, spreadRadius: .5, blurRadius: 50),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    type: BottomNavigationBarType.fixed,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.call,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.chat_bubble_2_fill,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.trash_fill,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          label: ""),
                    ],
                    // currentIndex: selectedIndex,
                    fixedColor: Colors.red,
                    // onTap: onItemTapped,
                    selectedLabelStyle:
                        TextStyle(color: Colors.grey, fontSize: 20),
                    unselectedFontSize: 16,
                    unselectedIconTheme: IconThemeData(
                        color: Colors.black, opacity: 1.0, size: 35.0),
                    selectedIconTheme:
                        IconThemeData(color: kgrey, opacity: 1.0, size: 35.0),
                    unselectedItemColor: Colors.black,
                    unselectedLabelStyle:
                        TextStyle(fontSize: 18, color: Colors.pink),
                  ),
                ))
            : SizedBox(height: 0));
  }
}
