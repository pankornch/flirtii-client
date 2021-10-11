import 'package:flirtii/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountNavbar extends StatelessWidget {
  const AccountNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Text(
              "Account",
              style: TextStyle(
                color: kMainDarkColor,
                fontSize: 32,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed("/edit_account");
              },
              child: Icon(
                Icons.settings,
                color: kMainDarkColor,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
