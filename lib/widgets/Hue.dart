import 'package:flutter/material.dart';

class HuePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    List<Color> colors = List();
    for (var i = 0; i <= 360; i++) {
      colors.add(HSVColor.fromAHSV(1,i*1.0, 1, 1).toColor());
    }
    List<double> positions = List();
    for (var i = 0; i <= 360; i++) {
      positions.add(i/360);
    }
    paint.shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: colors,
//        stops:positions,
        tileMode: TileMode.clamp).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(HuePainter oldDelegate) {
    return false;
  }
}

class Hue extends StatefulWidget {
  final Size size;
  const Hue(
      {Key key,
        this.size: const Size(100.0, 50.0),})
      : super(key: key);

  @override
  HueState createState() => HueState();
}

class HueState extends State<Hue> {
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: widget.size,
            painter: HuePainter(),
          )
        ],
      ),
    );
  }
}
