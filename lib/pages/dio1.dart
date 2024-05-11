import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

const kLargeTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(129, 165, 168, 1),
);
const kSmallTextStyle = TextStyle(
  fontSize: 16,
);

class dio1 extends StatelessWidget {
  int count = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 95,
                    height: 95,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/images/dp.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Rajamugesh',
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Tce | Clg',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialButton(
                      icon: Icons.facebook,
                      iconColor: Color.fromRGBO(223, 79, 126, 1),
                      containerColor: Color.fromRGBO(223, 79, 126, .2),
                    ),
                    SocialButton(
                      icon: Icons.whatshot,
                      iconColor: Color.fromRGBO(41, 117, 255, 1),
                      containerColor: Color.fromRGBO(41, 117, 255, .2),
                    ),
                    SocialButton(
                      icon: Icons.mail,
                      iconColor: Color.fromRGBO(244, 96, 121, 1),
                      containerColor: Color.fromRGBO(244, 96, 121, .2),
                    ),
                    SocialButton(
                      icon: Icons.update_outlined,
                      iconColor: Color.fromRGBO(32, 138, 197, 1),
                      containerColor: Color.fromRGBO(32, 138, 197, .2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PostFollower(
                      number: 01,
                      title: 'Posts',
                    ),
                    PostFollower(
                      number: count,
                      title: 'Following',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 180),
                        padding: EdgeInsets.only(left: 03),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text(
                            "Message",
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 260),
                        padding: EdgeInsets.only(left: 03),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          child: Text(
                            "View Project",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            launch(
                                'https://drive.google.com/drive/folders/1Efm616xIoZz6dPaOIQuLzpeh9hRQpRMW');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    GalleryImage(
                      imagePath: 'lib/images/nato.jpg',
                    ),
                    // GalleryImage(
                    //   imagePath: 'lib/images/1423.jpg',
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imagePath;

  GalleryImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PostFollower extends StatelessWidget {
  final int number;
  final String title;

  PostFollower({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: kLargeTextStyle,
        ),
        Text(
          title,
          style: kSmallTextStyle,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  SocialButton(
      {required this.icon,
      required this.iconColor,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    );
  }
}
