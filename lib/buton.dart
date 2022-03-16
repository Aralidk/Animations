import 'package:flutter/material.dart';

class buton extends StatefulWidget {
  buton({this.height = 60, this.borderWidth =3 , required this.go, required this.cancel,});
  final double? height;
  final double? borderWidth;
  final VoidCallback go;
  final VoidCallback cancel;

  @override
  _butonState createState() => _butonState();
}

class _butonState extends State<buton> {
  late double maxWidth;
  late double handleSize;
  double dragValue = 0;
  double dragWidth = 0;
  bool _go = false;
  @override
  Widget build(BuildContext context) {
    handleSize = (widget.height! - (widget.borderWidth! * 2));
    return Scaffold(
      body: Center ( child : LayoutBuilder(builder: (context, constraint) {
        maxWidth = constraint.maxWidth;
        return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: widget.height,
            decoration: BoxDecoration(
              color: _go ? Colors.white : Colors.blueGrey,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: _go ? Colors.white : Colors.blueGrey,
                width: widget.borderWidth!,
              ),
            ),
            child: Center(
              child: Stack(
                children: [ Text(_go ? "Başlatıldı" : "Başlatmak için çekiniz",
                    style: TextStyle(
                          color: _go ? Colors.black54 : Colors.white,
                      fontSize: 15
                    ) ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: dragWidth <= handleSize ? handleSize : dragWidth,
                  child: Row(
                    children: [
                      Expanded(child: SizedBox.shrink()),
                      GestureDetector(
                        onVerticalDragUpdate: onDragUpdate,
                        onVerticalDragEnd: onDragEnd,
                        child: Container(
                          width: handleSize,
                          height: handleSize,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
              )]),
            ));
      }),
      ) );
  }


void onDragUpdate(DragUpdateDetails details) {
  setState(() {
    dragValue = (details.globalPosition.dx) / maxWidth;
    dragWidth = maxWidth * dragValue;
  });
}

void onDragEnd(DragEndDetails details) {
  if (dragValue > .9) {
    dragValue = 1;
  } else {
    dragValue = 0;
  }

  setState(() {
    dragWidth = maxWidth * dragValue;
    _go = dragValue == 1;
  });

  if (dragValue == 1) {
    widget.go();
  } else {
    widget.cancel();
  }
}
}