import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle=false,  String strTitle = '', disappearedBackButton = false})
{
  return AppBar(
    iconTheme: IconThemeData(
      color:Colors.white,
    ),
    automaticallyImplyLeading: disappearedBackButton ? false : true,
    title: Text(
      isAppTitle ? "project Share" : strTitle,
      style: TextStyle(color: Colors.white,
      fontStyle: isAppTitle ? FontStyle.italic : FontStyle.normal,
      fontSize: isAppTitle ? 30.0 : 22.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Colors.blueAccent,
  );
}
