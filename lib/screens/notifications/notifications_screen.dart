import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/screens/notifications/widgets/card.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            color: kMainDarkColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: kMainDarkColor, //change your color here
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            NotificationCard(
              withBackground: true,
            ),
            NotificationCard(
              withBackground: false,
            ),
          ],
        ),
      ),
    );
  }
}
