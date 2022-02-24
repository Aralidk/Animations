import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text(
          "Bina Risk Raporu",
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            kutu(
              aciklama: "Planda Düzensizlik / Burulma Olası Hasara Etkisi",
            ),
            kutu(aciklama: "Düşeyde Düzensizlik Olası Hasara Etkisi",),
            kutu(aciklama:"Yumusak Kat Olası Hasara Etkisi",),
            kutu(aciklama: "Kısa Kolon Olası Hasara Etkisi",),
            kutu(aciklama: "Yapi Nizamıı Olası Hasara Etkisi",),
          ],
        ),
      ),
    );
  }

}

class kutu extends StatefulWidget {
  final aciklama;
  kutu({this.aciklama});

  @override
  _kutuState createState() => _kutuState(text: aciklama );

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
    }
    else if(sliderValue<=30){
      label_aciklama = "Az";
    }
    else if (sliderValue<=60){
      label_aciklama= "Orta";
    }
    else{
      label_aciklama = "Yüksek";
    }
    return label_aciklama;

  }


  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.indigo[200], borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Slider(
            activeColor: (func().toString()=="Yüksek")? Colors.red : (func().toString()=="Orta")? Colors.amberAccent : (func().toString()=="Az")? Colors.lightGreen : Colors.white,
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
        Text(text),
          SizedBox(height: 8)
        ],
      ),
    );

  }
}
