import 'package:flutter/material.dart';
import 'package:testeur/utilities/constants.dart';
import 'package:testeur/utilities/styleguide.dart';
import 'package:testeur/models/character.dart';

class CharacterDetailWidget extends StatefulWidget {
  Character character;
  CharacterDetailWidget({Key key, this.character}) : super(key: key);
  @override
  _CharacterDetailWidget createState() => _CharacterDetailWidget();
}

class _CharacterDetailWidget extends State<CharacterDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: backgroundStyle,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close,
                          color: Colors.white.withOpacity(0.9), size: 40)),
                  Image.asset(widget.character.imagePath),
                  Text(widget.character.name, style: AppTheme.heading),
                  SizedBox(height: 20),
                  Text(widget.character.description, style: AppTheme.subHeading)
                ]),
          ),
        ),
      ),
    );
  }
}
