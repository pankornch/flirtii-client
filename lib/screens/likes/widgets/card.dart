import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';

class LikeCard extends StatelessWidget {
  final String buttonType;
  const LikeCard({Key? key, required this.buttonType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleContainer(
            size: 70,
            child: Image.network(
              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matylda Navarro",
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Liked 12 hours ago"),
              ],
            ),
          ),
          // _UnLike(),
          buttonType == "LIKE_BACK" ? _LikeBack() : _UnLike(),
        ],
      ),
    );
  }
}

class _UnLike extends StatelessWidget {
  const _UnLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text("Unlike"),
    );
  }
}

class _LikeBack extends StatelessWidget {
  const _LikeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      decoration: BoxDecoration(
        color: kMainPinkColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        "Like Back",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
