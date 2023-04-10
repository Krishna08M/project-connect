import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';
import 'Profile.dart';
import 'Search.dart';
import 'TimeLine.dart';
import 'Upload.dart';
import 'activity_feed.dart';

final PageController pageController = PageController();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  int getPageindex = 0;

  whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageindex = pageIndex;
    });
  }

  onTapChangePage(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 400), curve: Curves.bounceInOut);
  }

  Scaffold buildHomeScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          TimeLinePage(),
          // ElevatedButton(
          //   child: Text("Logout"),
          //   onPressed: () {
          //     FirebaseAuth.instance.signOut().then((value) {
          //       print("Signed Out");
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => SigInScreen()));
          //     });
          //   },
          // ),
          SearchPage(),
          UploadPage(),
          NotificationsPage(),
          ProfilePage(),
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        child: CupertinoTabBar(
          currentIndex: getPageindex,
          onTap: onTapChangePage,
          backgroundColor: Colors.blueAccent,
          activeColor: Colors.black,
          inactiveColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
              Icons.home,
            )),
            BottomNavigationBarItem(icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.photo_camera,
              size: 37.0,
            )),
            BottomNavigationBarItem(icon: Icon(Icons.upload)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
