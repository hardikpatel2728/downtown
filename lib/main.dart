import 'package:downtown/mainpage.dart';
import 'package:downtown/splash.dart';
import 'package:flutter/material.dart';
import 'listgr.dart';
import 'my.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: homepage(),
        );
      },
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Adaptive.h(12.5), // or 12.5.h
            width: 50.w, // or Adaptive.w(50)
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              image: DecorationImage(image: AssetImage("images/1.jpg"),fit: BoxFit.cover)
            ),
          ),
          Device.orientation == Orientation.portrait
              ? Text("My orientation is Portrait")
              : Text("My orientation is Landscape"),


        ],
      ),
    );
  }
}