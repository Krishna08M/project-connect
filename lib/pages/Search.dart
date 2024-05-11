import 'package:social_media/models/User1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'dio1.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int count = 0;
  List<user1> _users = [
    user1(
        'Raj',
        '@Rajamugesh',
        'https://bestprofilepictures.com/wp-content/uploads/2020/07/Awesome-Profile-Picture-For-Facebook.jpg',
        false),
    user1(
        'Krishna',
        '@krish07',
        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9',
        false),
    user1(
        'Ajay Kumar',
        '@Aj_tamil',
        'https://4.bp.blogspot.com/-L9CtV6gR8GI/WtgKA619aEI/AAAAAAAAF9c/CubtyZE94o076qCShJN_D2bdNiHoeIRxACEwYBhgL/s320/cool+profile+images.png',
        false),
    user1(
        'Ram',
        '@ram_ms',
        'https://img.freepik.com/free-photo/classic-portrait-silhouette-man_23-2149707002.jpg?w=996&t=st=1681447371~exp=1681447971~hmac=de14bbc53e4a209b92e24a4630200dbc1b116602d615ffab2a311da343be0538',
        false),
    user1(
        'Nithish',
        '@Nk_01',
        'https://yt3.ggpht.com/a/AATXAJzzcKWJUsZXUGIU9zl9ljVYJAzpBA2plibHhA=s900-c-k-c0xffffffff-no-rj-mo',
        false),
    user1(
        'Tony',
        '@As_Tony',
        'https://www.goodmorninghdloveimages.com/wp-content/uploads/2020/04/Whatsapp-Profile-Pic-Photo-9.jpg',
        false),
    user1(
        'kishor',
        '@kishor_1',
        'https://th.bing.com/th/id/R.475d4e1f7f76d913f924c18b5ee62ad3?rik=82pFmt%2boTC2AOg&riu=http%3a%2f%2fwww.adventhealthdiabetesinstitute.com%2fsites%2fdefault%2ffiles%2fstyles%2fcrop_1_1%2fpublic%2f2020-05%2fAH_icon_1575560888.png%3fitok%3dy29lfU_f&ehk=qw14pJe9yGWuLWxTZJKzcPpb4MypzxMBXCiAx3gEtXY%3d&risl=&pid=ImgRaw&r=0',
        false),
  ];

  List<user1> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: _foundedUsers.length > 0
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: userComponent(user: _foundedUsers[index]),
                    actions: <Widget>[
                      new IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      new IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => dio1())),
                      ),
                      new IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () => print('Delete'),
                      ),
                    ],
                  );
                })
            : Center(
                child: Text(
                "No users found",
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }

  userComponent({required user1 user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (context) => dio1()));
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color:
                      user.isFollowedByMe ? Color(0xffffff) : Colors.blue[700],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: user.isFollowedByMe
                        ? Colors.transparent
                        : Colors.grey.shade700,
                  )),
              child: Center(
                  child: Text(user.isFollowedByMe ? 'Follow' : 'UnFollow',
                      style: TextStyle(
                          color: user.isFollowedByMe
                              ? Colors.white
                              : Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
