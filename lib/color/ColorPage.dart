import 'dart:async';

import 'package:flutter/material.dart';
import 'package:led/widgets/ColorPicker.dart';
import 'package:led/widgets/ProgressButton.dart';

///
/// Row相当于Android   LinearLayout 里面的android:orientation="horizontal”
/// Column相当于Android   LinearLayout 里面的android:orientation="vertical”
/// MainAxisAlignment有6个属性值，默认值为start
/// MainAxisAlignment.start，将子控件放在主轴的起始位置。
/// MainAxisAlignment.end，将子控件放在主轴末尾。
/// MainAxisAlignment.center，将子控件放在主轴中间位置。
/// MainAxisAlignment.spaceBetween 将主轴方向上的空白区域等分，使得子孩子控件之间的空白区域相等，两端的子孩子控件都靠近首尾，没有间隙。
/// MainAxisAlignment.spaceAround 将主轴方向上的空白区域等分，使得子孩子控件之间的空白区域相等，两端的子孩子控件都靠近首尾，首尾子孩子控件的空白区域为1/2。
/// MainAxisAlignment.spaceEvenly 将主轴方向上的空白区域等分，使得子孩子控件之间的空白区域相等，包括首尾。
///
class ColorPage extends StatefulWidget {
  @override
  ColorState createState() {
    return ColorState();
  }
}
const double kStep = 2.0;
class ColorState extends State<ColorPage> {
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;
  double _offValue = 0;
  double progress = 0.0;
  Timer timer;
  void start() {
    if (progress == 100.0)
      setState(() => progress = 0.0);
    else
      timer = Timer.periodic(Duration(milliseconds: 50), (t) {
        if (progress == 100.0)
          t.cancel();
        else
          setState(() => progress = progress + kStep);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max, //相当于Android的match_parent
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30.0,
              ),
            ],
          ),
          ColorPicker(),
          ProgressButton(
            key: Key('progressButton'),
            percentProgress: progress,
            onPressed: start,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("RED"),
          ),
          Slider(
            min: 0,
            max: 255,
            value: _redValue,
            onChanged: (double value) {
              setState(() {
                _redValue = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("GREEN"),
          ),
          Slider(
            min: 0,
            max: 255,
            value: _greenValue,
            onChanged: (double value) {
              setState(() {
                _greenValue = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("BLUE"),
          ),
          Slider(
            min: 0,
            max: 255,
            value: _blueValue,
            onChanged: (double value) {
              setState(() {
                _blueValue = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("OFF"),
          ),
          Slider(
            min: 0,
            max: 255,
            value: _offValue,
            onChanged: (double value) {
              setState(() {
                _offValue = value;
              });
            },
          ),
        ],
      ),
    ));
  }
}
