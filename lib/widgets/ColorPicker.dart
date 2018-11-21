import 'package:flutter/material.dart';

class ColorPickerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    //flutter暂未看到混合渐变相关api 无法实现
//    LinearGradient vertical = LinearGradient(
//        begin: Alignment.topLeft,
//        end: Alignment.bottomRight,
//        colors: [
//          Colors.white,
//          Colors.black,
//        ],
//        tileMode: TileMode.clamp);
//    LinearGradient horizontal = LinearGradient(
//        begin: Alignment.topLeft,
//        end: Alignment.centerRight,
//        colors: [
//          Colors.white,
//          Colors.red,
//        ],
//        tileMode: TileMode.clamp);
//    val composeShader = ComposeShader(horizontal, vertical, PorterDuff.Mode.MULTIPLY)
//    paint..shader = horizontal.createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0));
//    canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), paint);
  }

  @override
  bool shouldRepaint(ColorPickerPainter oldDelegate) {
    return false;
  }
}

class ColorPicker extends StatefulWidget {
  @override
  ColorPickerState createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: ColorPickerPainter(),
          )
        ],
      ),
    );
  }
}
