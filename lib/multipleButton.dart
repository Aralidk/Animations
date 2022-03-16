import 'dart:math';
import 'package:flutter/material.dart';

class multipleButton extends StatefulWidget {
  const multipleButton({Key? key}) : super(key: key);

  @override
  State<multipleButton> createState() => _multipleButtonState();
}

class _multipleButtonState extends State<multipleButton> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> ScaleValue;
  late Animation<double> RotateValue;
  bool condition = false ;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    ScaleValue = Tween(end:1.0 ,begin: 0.0).animate(controller)..addListener(() {setState(() {});});
    RotateValue = Tween(end: pi/2 ,begin: 0.0).animate(controller)..addListener(() {setState(() {});});
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: ScaleValue.value,
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {},
                tooltip: "Dosya Ekle",
                child: Icon(Icons.document_scanner),
              ),
            ),
            Transform.scale(
              scale: ScaleValue.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  onPressed: () {},
                  tooltip: "Resim Ekle",
                  child: Icon(Icons.photo_camera),
                ),
              ),
            ),
            Transform.rotate(
              angle: RotateValue.value,
              child: FloatingActionButton(
                backgroundColor: Colors.lightGreen,
                onPressed: () {
                  if(condition == true){
                    controller.reverse();
                    condition = false;
                  }
                  else{
                    controller.forward();
                    condition = true;
                  }
                },
                tooltip: "Ekle",
                child: AnimatedIcon(
                  progress: controller,
                  icon: AnimatedIcons.menu_close

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
