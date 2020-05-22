import 'package:flutter/material.dart';

class TabBarNavigation extends StatefulWidget {
  @override
  _TabBarNavigation createState() => _TabBarNavigation();
}

class _TabBarNavigation extends State<TabBarNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(),
    );
  }
}

class BottomNavyBar extends StatefulWidget {
  @override
  _BottomNavyBar createState() => _BottomNavyBar();
}

class _BottomNavyBar extends State<BottomNavyBar> {
  Color backgroundColor = Colors.white;
  int selectedIndex = 0;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('HOME'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.favorite_border), Text('FAVORITE'),Colors.pinkAccent),
    NavigationItem(Icon(Icons.search), Text('SEARCH'), Colors.amber),
    NavigationItem(Icon(Icons.person_outline), Text('PROFILE'), Colors.cyan)
  ];
  Widget _builItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 280),
      padding: isSelected ? EdgeInsets.only(left: 10, right: 8) : null,
      height: double.maxFinite,
      width: isSelected ? 130 : 50,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color, borderRadius: BorderRadius.circular(50))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            IconTheme(
                data: IconThemeData(
                    size: 24,
                    color: isSelected ? backgroundColor : item.color),
                child: item.icon),
            isSelected
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: DefaultTextStyle.merge(
                        style: TextStyle(
                            color: isSelected ? backgroundColor : Colors.black,
                            fontFamily: 'CM Sans Serif',
                            fontWeight: FontWeight.bold),
                        child: item.title),
                  )
                : Container()
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10, top: 8, bottom: 20),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [(BoxShadow(color: Colors.black12, blurRadius: 4))]),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
                child: _builItem(item, selectedIndex == itemIndex));
          }).toList()),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;
  NavigationItem(this.icon, this.title, this.color);
}
