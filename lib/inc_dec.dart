/*import 'package:flutter/material.dart';
import 'package:stepo/stepo.dart';

class incrementDecrement extends StatefulWidget {
  const incrementDecrement({Key? key}) : super(key: key);

  @override
  State<incrementDecrement> createState() => _incrementDecrementState();
}

class _incrementDecrementState extends State<incrementDecrement> {
  @override
  Widget build(BuildContext context) {
    return Stepo(
      key: UniqueKey(),
      backgroundColor: Colors.indigo, //Optional
      style: Style.horizontal, //Optional
      textColor: Colors.white, //Optional
      animationDuration: Duration(milliseconds: 500), //Optional
      iconColor: Colors.white, //Optional
      fontSize: 15, //Optional
      iconSize: 15, //Optional
      initialCounter: 25, //Optional
      lowerBound: 0, //Optional
      upperBound: 50, //Optional
      onIncrementClicked: (counter) {
        //Optional
        print("Increment clicked");
      },
      onDecrementClicked: (counter) {
        //Optional
        print("Decrement clicked");
      },
    );
  }
}
*/

import 'package:flutter/material.dart';

class inc extends StatefulWidget {
  @override
  State<inc> createState() => _incState();
}

class _incState extends State<inc> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation sizeAnimation;
  double buildingNumber = 0;
  double currentState = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0,end: 60.0).animate(controller)..addListener((){
      setState(() {

      });
    });
    sizeAnimation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller,curve: Curves.fastOutSlowIn))..addListener((){
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
    return Stack (
      alignment: Alignment.center,
        children: [
      Positioned(
        bottom: animation.value,
        child:
            Transform.scale(
              scale: sizeAnimation.value,
              child: IconButton(
                iconSize: 35,
                color: Colors.blue[100],
                onPressed: () {
                  controller.forward();
                  setState(() {
                    buildingNumber--;
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ), ),
            Text(
              buildingNumber.toString(),
              style: TextStyle(fontSize: 30, color: Colors.indigo),
            ),
            Positioned(
              child: Transform.scale(
                scale: sizeAnimation.value-1,
                child: IconButton(
                    onPressed: () {
                      controller.forward();
                      setState(() {
                        buildingNumber++;
                      });
                    },
                    color: Colors.blue[100],
                    iconSize: 35,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    )),
              ),
            ),
          ],
        );
  }
}
