import 'package:flutter/material.dart';

class animationController extends StatefulWidget {
  @override
  State<animationController> createState() => _animationControllerState();
}

class _animationControllerState extends State<animationController>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationValue = Tween(begin: 1.0, end: 0.0).animate(controller)..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: animationValue.value,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.orange, shape: CircleBorder(),
            fixedSize: Size(150, 150)),
              onPressed: () {
              controller.forward();
              },
              child: Text(
                "Ekle",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
