import 'package:flutter/material.dart';


class kutu extends StatefulWidget {
  final aciklama;
  kutu({this.aciklama});

  @override
  _kutuState createState() => _kutuState(text: aciklama);
}

class _kutuState extends State<kutu> {
  double sliderValue = 0;
  @override
  final String text;

  _kutuState({required this.text});

  func() {
    String label_aciklama;
    if (sliderValue == 0) {
      label_aciklama = "Yok";
    } else if (sliderValue <= 30) {
      label_aciklama = "Az";
    } else if (sliderValue <= 60) {
      label_aciklama = "Orta";
    } else {
      label_aciklama = "Yüksek";
    }
    return label_aciklama;
  }

  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return AnimatedContainer(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: sliderValue > 0 ? 150.0 : screensize.height / 6,
      decoration: BoxDecoration(
          color: sliderValue > 0 ? Colors.blue[100] : Colors.indigo,
          borderRadius: BorderRadius.circular(30)),
      duration: const Duration(seconds: 3),
      curve: Curves.elasticOut,
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
              child: Text(text),
              style: TextStyle(
                fontSize: sliderValue > 0 ? 15 : 18,
                color: sliderValue > 0 ? Colors.black : Colors.white,
              ),
              duration: Duration(milliseconds: 20)),
          Slider(
            activeColor: (func().toString() == "Yüksek")
                ? Colors.red
                : (func().toString() == "Orta")
                    ? Colors.amberAccent
                    : (func().toString() == "Az")
                        ? Colors.lightGreen
                        : Colors.white,
            inactiveColor: Colors.amber[200],
            thumbColor: Colors.indigo,
            label: func().toString(),
            value: sliderValue,
            max: 100,
            divisions: 10,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
