import 'package:flutter/material.dart';
import 'package:testeur/test.dart';
import 'package:testeur/login/login1.dart';
import 'package:testeur/Onboarding/onBoardingUI.dart';
import 'package:testeur/tabar/tabBar.dart';
import 'package:testeur/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'testeur',
       debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/home': (context) => HomeTest(),
      '/nav': (context) => TabBarNavigation(),
      '/': (context) => OnboardingScreen(),
      '/login': (context) => LoginScreen(),
      '/first': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    },
    );}
}
