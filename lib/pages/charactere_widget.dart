import 'package:flutter/material.dart';
import 'package:testeur/utilities/constants.dart';
import 'package:testeur/models/character.dart';
import 'package:testeur/utilities/styleguide.dart';
import 'package:testeur/pages/charactereDetails.dart';

class CharactereWidget extends StatefulWidget {
  @override
  _CharactereWidget createState() => _CharactereWidget();
}

class _CharactereWidget extends State<CharactereWidget> {
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(microseconds: 350),
                pageBuilder: (context, _, __) =>
                    CharacterDetailWidget(character: characters[0])));
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.5),
                height: 0.55 * screenHeight,
                width: 0.9 * screenHeight,
                decoration: backgroundStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Image.asset(characters[0].imagePath,
                height: screenHeight * 0.55),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(characters[0].name, style: AppTheme.heading),
                  Text('Tap to read more', style: AppTheme.subHeading)
                ]),
          )
        ],
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
