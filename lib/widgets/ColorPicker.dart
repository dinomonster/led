import 'package:flutter/material.dart';

class ColorPickerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    LinearGradient vertical = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Colors.black,
        ],
        tileMode: TileMode.clamp);
    LinearGradient horizontal = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.white,
          Colors.black,
        ],
        tileMode: TileMode.clamp);
    horizontal.createShader(rect)
    val composeShader = ComposeShader(horizontal, vertical, PorterDuff.Mode.MULTIPLY)
    paint..shader = ;
  }

  @override
  bool shouldRepaint(ColorPickerPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class ColorPicker extends StatefulWidget {
  @override
  ColorPickerState createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  Widget build(BuildContext context) {
    return;
  }
}
