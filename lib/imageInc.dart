import 'package:flutter/material.dart';

class imageIncrement extends StatefulWidget {


  @override
  State<imageIncrement> createState() => _imageIncrementState();
}

class _imageIncrementState extends State<imageIncrement> {
  int buildingNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 40,
              color: Colors.indigo,
              onPressed: () {
                setState(() {
                  buildingNumber--;
                });
              },
              icon: Icon(Icons.arrow_circle_down),
            ),
            Container(
              width: 130,
              height: 130,
              child: Center(
                child: Text(buildingNumber.toString(), style: TextStyle(fontSize: 30,color: Colors.indigo, fontWeight: FontWeight.bold),),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.2,
                  image: AssetImage('assets/2.png'),
                ),
              ),
            ),
            IconButton(
              iconSize: 40,
              color: Colors.indigo,
              onPressed: () {
                setState(() {
                  buildingNumber++;
                });
              },
              icon: Icon(Icons.arrow_circle_up),
            ),
          ],
        ),
      ),
    );
  }
}
