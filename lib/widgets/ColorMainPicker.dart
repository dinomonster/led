import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorMainPickerPainter extends CustomPainter {
  static const markerRadius = 5.0;
  static const storeWidth = 1.0;
  final double xPos;
  final double yPos;

  ColorMainPickerPainter(this.xPos, this.yPos);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = storeWidth;
    canvas.drawCircle(Offset(xPos, yPos), markerRadius, paint);
//    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(ColorMainPickerPainter old) =>
      xPos != old.xPos && yPos != old.yPos;
}

class ColorMainPicker extends StatefulWidget {
  final double xPos;
  final double yPos;
  final ValueChanged<Offset> onChanged;
  final Size size;

  const ColorMainPicker(
      {Key key, this.onChanged, this.xPos: 0.0, this.yPos: 0.0, this.size})
      : super(key: key);

  @override
  ColorMainPickerState createState() => ColorMainPickerState();
}

class ColorMainPickerState extends State<ColorMainPicker> {
  double xPos = 0.0;
  double yPos = 0.0;
  GlobalKey _painterKey = new GlobalKey();

  void onChanged(Offset offset) {
    final RenderBox referenceBox = context.findRenderObject();
    Offset position = referenceBox.globalToLocal(offset);
    if (widget.onChanged != null) widget.onChanged(position);

    setState(() {
      xPos = position.dx;
      yPos = position.dy;
    });
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      // ??
    }
  }

  void _handlePanStart(DragStartDetails details) {
    onChanged(details.globalPosition);
  }

  void _handlePanEnd(DragEndDetails details) {
    print('end');
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    onChanged(details.globalPosition);
  }

  void _handleTapDown(TapDownDetails details) {
    onChanged(details.globalPosition);
  }

  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
//      constraints: BoxConstraints.expand(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
//        onPanStart: _handlePanStart,
//        onPanEnd: _handlePanEnd,
//        onPanUpdate: _handlePanUpdate,
        onTapDown: _handleTapDown,
        child: CustomPaint(
          size: Size(xPos, yPos),
          painter: ColorMainPickerPainter(xPos, yPos),
        ),
      ),
    );
  }
}
