import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';

class ChatTextCardRecipent extends StatelessWidget {
  const ChatTextCardRecipent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 50,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: kMainPurpleColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTextCardSender extends StatelessWidget {
  const ChatTextCardSender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleContainer(
            size: 30,
            child: Image.network(
              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut"),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
