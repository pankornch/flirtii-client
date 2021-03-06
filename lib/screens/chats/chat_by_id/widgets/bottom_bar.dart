import 'package:flirtii/configs/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBottomBar extends StatefulWidget {
  final Function onSubmit;
  ChatBottomBar({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _ChatBottomBarState createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  var messageController = TextEditingController();

  onSubmit() async {
    await widget.onSubmit.call(messageController.text);

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, -4),
          color: Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: 2,
        ),
      ]),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Type a message",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.image,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onSubmit,
            child: Container(
              height: 50,
              child: Center(
                child: Icon(
                  Icons.send,
                  color: kMainPurpleColor,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
