import 'package:flutter/material.dart';
import 'package:led/GlobalConfig.dart';
import 'package:led/color/ColorPage.dart';
import 'package:led/index/NavigationIconView.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() =>_IndexState();

}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: Icon(Icons.assignment),
        title: Text("COLOR"),
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.all_inclusive),
        title: Text("FAVORITES1"),
        vsync: this,
      ),
      NavigationIconView(
        icon: Icon(Icons.add_shopping_cart),
        title: Text("CUSTOM"),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      ColorPage(),
      ColorPage(),
      ColorPage(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) =>
        navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: GlobalConfig.primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        });

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.close),
            title: Text("led"),
            centerTitle: true,
            elevation: 0.7,
            actions: <Widget>[
              new Icon(Icons.more_vert)
            ],
          ),
          body: Center(child: _currentPage),
          bottomNavigationBar: bottomNavigationBar,
        ),
        theme: GlobalConfig.themeData);
  }
}