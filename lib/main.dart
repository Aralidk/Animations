import 'package:flutter/material.dart';
import 'package:untitled/flip.dart';
import 'package:untitled/imageInc.dart';
import 'package:untitled/multipleButton.dart';
import 'package:untitled/playbutton.dart';
import 'circular_slider.dart';
import 'inc_dec.dart';
import 'kutu.dart';
import 'buton.dart';
import 'dart:math';
import 'opacity.dart';
import 'scaleAnimation.dart';


void main() {
  runApp(SliderApp());
}

class SliderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
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
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              text_buton("Circular Slider", circularSlider()),
              text_buton("Multiple Button", multipleButton()),
              text_buton("Scale and Rotate", scale()),
              text_buton("Opacity", animationController()),
              text_buton("Flip", flip()),
              text_buton("Container with Slider", kutuSayfa()),
              text_buton("Swipe", buton(go: (){}, cancel: (){})),
              text_buton("Incremetn with Image", imageIncrement()),
            ],),
          )
          
          //imageIncrement(),
          //inc(),
          // incrementDecrement(), null safety sound desteklemiyor
          //circularSlider()
          //multipleButton()
          //scale(),
          //animationController(),
          //kutuSayfa(),
          //PlayButton(onPressed: () {  },),
          //flip(),
          //buton(go: () {  },cancel: (){},),
          ),
        );
  }

  TextButton text_buton(String text, sayfa) => TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => sayfa),);
  },
     style: TextButton.styleFrom(
       backgroundColor: Colors.indigo,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
     ),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white),));
}

class kutuSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
      ),
    );
  }
}
