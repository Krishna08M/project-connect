import 'package:flutter/material.dart';

import 'ArticalView.dart';

class articale extends StatefulWidget {
  const articale({Key? key}) : super(key: key);

  @override
  State<articale> createState() => _articaleState();
}

class _articaleState extends State<articale> {
  final _controllerdetails = TextEditingController();
  final _controllerArtical = TextEditingController();

  String name = "";
  String detail = "";
  String about = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Atricale About Project"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              passtosecondpage(context);
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child: Image.asset(
                'lib/images/load.jpg',
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(126, 204, 246, 100),
              ),
              padding: EdgeInsets.all(11),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Suggess your idea",
                    hintText: "Enter the idea",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: _controllerArtical,
                maxLines: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void passtosecondpage(BuildContext context) {
    String senddetail = _controllerArtical.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticalView(Artical: senddetail)));
  }
}
