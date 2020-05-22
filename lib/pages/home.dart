import 'package:flutter/material.dart';
import 'package:testeur/tabar/tabBar.dart';
import 'package:testeur/utilities/styleguide.dart';
import 'package:testeur/pages/charactere_widget.dart';

class HomeTest extends StatefulWidget {
  @override
  _HomeTest createState() => _HomeTest();
}

class _HomeTest extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                print('ok');
              },
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(left:32, right:32, top: 8.0),
      alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Despicable Me', style: AppTheme.display1),
        Text('Caractere', style: AppTheme.display2),
         SizedBox(height: 25.0),
        Expanded(child: CharactereWidget())
      ],
    ));
  }
}
