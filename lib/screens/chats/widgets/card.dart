import 'package:flirtii/models/chat.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  const ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed("/chat/${chat.id}");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleContainer(
                  child: Image.network(
                    chat.friend?.avatar == null
                        ? "https://i.pravatar.cc/150?u=${chat.friend!.id}"
                        : chat.friend!.avatar!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${chat.friend?.firstName} ${chat.friend?.lastName}",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    Container(
                      width: size.width - 150,
                      padding: new EdgeInsets.only(right: 13.0),
                      child: Text(
                        "${chat.lastMessage!.text}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Text("1m"),
          ],
        ),
      ),
    );
  }
}
