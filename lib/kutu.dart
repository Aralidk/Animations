import 'package:flutter/material.dart';


class kutu extends StatefulWidget {
  final aciklama;
  kutu({this.aciklama});

  @override
  _kutuState createState() => _kutuState(text: aciklama);
}

class _kutuState extends State<kutu> with TickerProviderStateMixin {
  late AnimationController sliderController;
  late Animation sliderColor;
  late Animation<double> sliderValue;

  @override
  void initState() {
    super.initState();
    sliderController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    sliderColor = ColorTween(end: Colors.red, begin: Colors.lightBlue)
        .animate(sliderController)
      ..addListener(() {
        setState(() {});
      });
    sliderValue = Tween(
      begin: 0.0,
      end: 60.0,
    ).animate(sliderController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    sliderController.dispose();
  }

  @override
  final String text;

  _kutuState({required this.text});

  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return AnimatedContainer(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: sliderValue.value > 0 ? 150.0 : screensize.height / 6,
      decoration: BoxDecoration(
          color: sliderValue.value > 0 ? Colors.blue[100] : Colors.indigo,
          borderRadius: BorderRadius.circular(30)),
      duration: Duration(seconds: 1),
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
              child: Text(text),
              style: TextStyle(
                fontSize: sliderValue.value > 0 ? 15 : 18,
                color: sliderValue.value > 0 ? Colors.black : Colors.white,
              ),
              duration: Duration(milliseconds: 20)),
          Slider(
              value: sliderValue.value,
              activeColor: sliderColor.value,
              min: 0,
              max: 100,
              onChanged: (Color) {
                sliderController.forward();
                sliderController.forward();
                if (sliderValue.value == 60) {
                  sliderController.reverse();
                }
              }),
        ],
      ),
    );
  }
}
