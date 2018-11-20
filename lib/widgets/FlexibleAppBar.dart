import 'package:flutter/material.dart';

class FlexibleAppBar extends AppBar {
  static const double height = 256.0;

  FlexibleAppBar(String title, String imageUrl)
      : super(
//            expandedHeight: height,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(title), background: _buildBackground(imageUrl)));

  static Widget _buildBackground(String imageUrl) {
    return new Stack(children: <Widget>[
//      new Image.network(imageUrl, fit: ImageFit.cover, height: height),
      new DecoratedBox(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: const FractionalOffset(0.5, 0.6),
                  end: const FractionalOffset(0.5, 1.0),
                  colors: <Color>[
            const Color(0x00000000),
            const Color(0x70000000)
          ])))
    ]);
  }
}
