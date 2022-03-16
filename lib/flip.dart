import 'package:flutter/material.dart';
import 'dart:math';


class flip extends StatefulWidget {
  @override
  _flipState createState() => _flipState();
}

class _flipState extends State<flip> {


  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    }); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _flip,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: angle),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double val, __) {
                if (val >= (pi / 2)) {
                  isBack = false;
                } else {
                  isBack = true;
                }
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(val),
                  child: Container(
                    width: 400,
                      height: 400,
                      child: isBack
                          ? Container(
                        color: Colors.blue[100],
                        child: AnimatedDefaultTextStyle(
                          textAlign: TextAlign.center,
                          duration: Duration(milliseconds: 10) , child: Text('Devam etmek icin dokunun'), style: TextStyle(
                            decorationColor: Colors.black,
                          fontSize: 35,

                        ) ,
                        ),
                      )
                          : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(pi),
                          child: Container(
                            color: Colors.blue,
                          ))),
                ));
              }),
        ),
      ),
    );
  }
}
