import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/screens/nav_menu.dart';
import 'package:sjcl/screens/events_screen.dart';
import 'package:sjcl/screens/notification_screen.dart';
import 'package:sjcl/screens/open_url.dart';

import 'screens/hom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print("currentIndex is : $index");
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      if (selectedIndex == 3) {
         openUrl(context,
             url: "https://www.sjcl.edu.in/index.php", color: Constants.primaryColor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            title: "St. Joseph's College of Law",
          ),
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
        ),
        drawer: const NavMenu(),
        body: PageView(
          controller: pageController,
          allowImplicitScrolling: true,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: const [
            HomeScreen(),
            EventsScreen(),
            NotificationScreen(),
            // NotificationPage(),
            //WebScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Constants.primaryColorYellow,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontSize: 18),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_sharp),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web_outlined),
              label: "",
              backgroundColor: Constants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
