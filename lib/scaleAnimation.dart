import 'dart:math';

import 'package:flutter/material.dart';

class scale extends StatefulWidget {
  @override
  State<scale> createState() => _scaleState();
}

class _scaleState extends State<scale>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleValue;
  late Animation<double> rotateValue;
  

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    scaleValue = Tween(begin: 150.0, end: 80.0).animate(controller)..addListener(() {
      setState(() {});});
    rotateValue =Tween(begin: 0.0,end: (pi*2) )
        .animate(CurvedAnimation(curve: Curves.easeInOut ,parent: controller))..addListener(() {setState(() {

    });});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotateValue.value,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),
            fixedSize: Size(scaleValue.value, scaleValue.value)
          ),
          onPressed: () {
            controller.repeat(reverse: true);
          },
          child: Text(
            "Ekle",
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
    );
  }
}
