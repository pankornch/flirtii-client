import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:flirtii/screens/sign_in/sign_in_screen.dart';
import 'package:flirtii/screens/discover/widgets/discover.dart';

final pages = [Discover(),Discover(),Discover(),Discover(),];

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pages[currentIndex]
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: currentIndex,
        // dotIndicatorColor: Colors.green,
        // unselectedItemColor: Colors.red,
        // selectedItemColor: Colors.red,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: [
          /// explore
          DotNavigationBarItem(
            icon: Icon(Icons.explore),
            selectedColor: Colors.purple,
          ),

          /// question_answer
          DotNavigationBarItem(
            icon: Icon(Icons.question_answer),
            selectedColor: Colors.pink,
          ),

          /// favorite
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: Colors.orange,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}