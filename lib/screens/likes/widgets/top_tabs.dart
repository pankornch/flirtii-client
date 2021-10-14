import 'package:flirtii/configs/constants.dart';
import 'package:flutter/material.dart';

class LikeTopTabs extends StatefulWidget {
  final List<String> tabs;
  final Function renderItem;
  LikeTopTabs({Key? key, required this.tabs, required this.renderItem});

  @override
  _LikeTopTabsState createState() => _LikeTopTabsState();
}

class _LikeTopTabsState extends State<LikeTopTabs> {
  int currentIndex = 0;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < widget.tabs.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: i != 10 - 1 ? 20 : 0),
                    decoration: BoxDecoration(
                      color: i == currentIndex
                          ? kMainPurpleColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                    child: Text(widget.tabs[i],
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              i == currentIndex ? Colors.white : kMainDarkColor,
                        )),
                  ),
                ),
            ],
          ),
        ),
        widget.renderItem(currentIndex),
      ],
    );
  }
}
