import 'package:flirtii/screens/likes/widgets/card.dart';
import 'package:flirtii/screens/likes/widgets/navbar_screen.dart';
import 'package:flirtii/screens/likes/widgets/top_tabs.dart';
import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        LikeNavBar(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: LikeTopTabs(
            tabs: ["All", "You Liked", "Request Likes"],
            renderItem: (int index) {
              return Container(
                height: size.height - (100 + 210),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < 10; i++)
                        LikeCard(
                          buttonType: index == 1 ? "UNLIKE" : "LIKE_BACK",
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
