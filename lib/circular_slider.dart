import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class circularSlider extends StatefulWidget {
  @override
  State<circularSlider> createState() => _circularSliderState();
}

class _circularSliderState extends State<circularSlider> {

  String valueChange(double value){
    final building = value.ceil().toInt().toString();
    return '$building';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            startAngle: 180,
            angleRange: 180,
            customColors: CustomSliderColors(
              trackColor: Colors.grey,
              progressBarColors: [Colors.blueGrey, Colors.lightBlueAccent, Colors.indigo]
              ),
            infoProperties: InfoProperties( modifier: valueChange)
            ),

          min: 0,
          max: 50,
          initialValue: 20,
          onChange: (double value){},
        ),
      ),
    );
  }
}
