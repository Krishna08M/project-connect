import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/models/User_preferences.dart';
import 'package:social_media/pages/articale.dart';
import 'package:social_media/widgets/header.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class TimeLinePage extends StatefulWidget {
  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  final user = UserPreferences.getUser();
  Color iconColor = Colors.blue;
  int count = 283, count1 = 201, count2 = 514;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Project share',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 30.0,
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 540.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      margin: EdgeInsets.all(4.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('lib/images/1423.jpg'),
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Ajay',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('5min ago'),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 5),
                          blurRadius: 8.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('lib/images/1423.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.favorite,
                                  size: 28,
                                ),
                                color: iconColor,
                                onPressed: () {
                                  setState(() {
                                    if (iconColor == Colors.blue) {
                                      iconColor = Colors.red;
                                      count++;
                                    } else if (iconColor == Colors.red) {
                                      iconColor = Colors.blue;
                                      count--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '$count',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.share,
                                  size: 24,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'share',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.send,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => articale()));
                                },
                              ),
                              Text(
                                'ideas',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 540.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      margin: EdgeInsets.all(4.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('lib/images/rajms.jpg'),
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Raj',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('1hr ago'),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 5),
                          blurRadius: 8.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('lib/images/naruto.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.favorite,
                                  size: 28,
                                ),
                                color: iconColor,
                                onPressed: () {
                                  setState(() {
                                    if (iconColor == Colors.blue) {
                                      iconColor = Colors.red;
                                      count1++;
                                    } else if (iconColor == Colors.red) {
                                      iconColor = Colors.blue;
                                      count1--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '$count1',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.share,
                                  size: 24,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (iconColor == Colors.blue) {
                                      iconColor = Colors.red;
                                    } else if (iconColor == Colors.red) {
                                      iconColor = Colors.blue;
                                    }
                                  });
                                },
                              ),
                              Text(
                                'share',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.send,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => articale()));
                                },
                              ),
                              Text(
                                'ideas',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 540.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      margin: EdgeInsets.all(4.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('lib/images/frd.jpg'),
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('2d ago'),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 5),
                          blurRadius: 8.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('lib/images/123.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.favorite,
                                  size: 28,
                                ),
                                color: iconColor,
                                onPressed: () {
                                  setState(() {
                                    if (iconColor == Colors.blue) {
                                      iconColor = Colors.red;
                                      count2++;
                                    } else if (iconColor == Colors.red) {
                                      iconColor = Colors.blue;
                                      count2--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '$count2',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.share,
                                  size: 24,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'share',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(left: 15.0),
                                icon: Icon(
                                  Icons.send,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => articale()));
                                },
                              ),
                              Text(
                                'ideas',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
