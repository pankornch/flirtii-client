import 'package:flutter/material.dart';

class LikeNavBar extends StatelessWidget {
  const LikeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Likes",
            style: TextStyle(fontSize: 24),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
