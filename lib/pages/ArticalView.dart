import 'package:flutter/material.dart';

class ArticalView extends StatefulWidget {
  String Artical;

  ArticalView({
    super.key,
    required this.Artical,
  });

  @override
  State<ArticalView> createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                color: Colors.white,
                child: Center(
                    child: Text(
                  "Improve Ideas",
                  style: TextStyle(fontSize: 26),
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 20),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.green,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'lib/images/improve.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                widget.Artical,
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
