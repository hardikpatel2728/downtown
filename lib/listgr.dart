import 'package:flutter/material.dart';

class mylist extends StatefulWidget {
  const mylist({Key? key}) : super(key: key);

  @override
  State<mylist> createState() => _mylistState();
}

class _mylistState extends State<mylist> {
  List<Object> _l = [
    "images/before_after.png",
    "images/birthday.png",
    "images/brush.png",
    "images/camera.png",
    "images/collage.png",
    "images/days_to_go.png",
    "images/dialogue.png",
    "images/photo frame.png",
    "images/slideshow.png",
    "images/trendy reels.png",
  ];
  List<Object> get l =>_l;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(itemCount: _l.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ListTile(
              title: Image(image: AssetImage(_l[index].toString())),
            );
          },)
    );
  }
}
