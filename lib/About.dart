import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "back",
                  )),
              Text("About"),
            ],
          ),
        ),
      ),
    );
  }
}
