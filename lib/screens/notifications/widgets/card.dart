import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final bool? withBackground;
  NotificationCard({Key? key, this.withBackground}) : super(key: key);

  Decoration getDecoration() {
    if (withBackground == null || !withBackground!) return BoxDecoration();
    return BoxDecoration(
        color: kMainPurpleColor.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: kMainPurpleColor.withAlpha(30),
              blurRadius: 4,
              spreadRadius: 4,
              offset: Offset(0, 4))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(14),
        decoration: getDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleContainer(
                  size: 70,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      child: Text("Matylda Navarro",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ),
                    Text("Liked 1 minute ago"),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: kMainPinkColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text("Like Back",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
