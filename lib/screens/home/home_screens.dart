import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/screens/chats/chat_screen.dart';
import 'package:flirtii/screens/likes/likes_screen.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flirtii/screens/discover/discover.dart';

final pages = [
  Discover(),
  ChatScreen(),
  LikesScreen(),
];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(child: pages[currentIndex]),
      ),
      bottomNavigationBar: DotNavigationBar(
        // backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: [
          /// explore
          DotNavigationBarItem(
            icon: Icon(Icons.explore),
            selectedColor: kMainPurpleColor,
          ),

          /// question_answer
          DotNavigationBarItem(
            icon: Icon(Icons.question_answer),
            selectedColor: kMainPurpleColor,
          ),

          /// favorite
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: kMainPurpleColor,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: kMainPurpleColor,
          ),
        ],
      ),
    );
  }
}
