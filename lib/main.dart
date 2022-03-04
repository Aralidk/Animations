import 'package:flutter/material.dart';
import 'package:untitled/flip.dart';
import 'package:untitled/playbutton.dart';
import 'kutu.dart';
import 'buton.dart';
import 'dart:math';

void main() {
  runApp(SliderApp());
}

class SliderApp extends StatelessWidget {
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: const Text(
            "Bina Risk Raporu",
          ),
        ),
        body: Center(
          child:
              //
          kutuSayfa(),
              //PlayButton(onPressed: () {  },),
          //flip(),
          //buton(go: () {  },cancel: (){},),
          ),


        );
  }
}

class kutuSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10),
      children: [
        kutu(
          aciklama: "Planda Düzensizlik / Burulma Olası Hasara Etkisi",
        ),
        kutu(
          aciklama: "Düşeyde Düzensizlik Olası Hasara Etkisi",
        ),
        kutu(
          aciklama: "Yumusak Kat Olası Hasara Etkisi",
        ),
        kutu(
          aciklama: "Kısa Kolon Olası Hasara Etkisi",
        ),
        kutu(
          aciklama: "Yapi Nizamıı Olası Hasara Etkisi",
        ),
      ],
    );
  }
}
