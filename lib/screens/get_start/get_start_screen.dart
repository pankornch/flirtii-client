import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/Checkbox.dart';
import 'package:flirtii/shared/DatePicker.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flirtii/shared/RadioGroup.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  _GetStartScreenState createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: MainContainer(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                    width: size.width,
                    height: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Input(hintText: "Nickname", labelText: "Nickname"),
                SizedBox(
                  height: 14,
                ),
                DatePicker(
                  title: "Date of Birth",
                ),
                SizedBox(
                  height: 14,
                ),
                RadioGroup(
                  title: "Gender",
                  onChange: (val) {},
                  options: [
                    OptionProps(title: "Male", value: "Male"),
                    OptionProps(title: "Female", value: "Female"),
                    OptionProps(title: "LGBT", value: "LGBT"),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Input(hintText: "Bio", labelText: "Bio"),
                SizedBox(
                  height: 14,
                ),
                SharedCheckBox(options: [
                  OptionProps(title: "Male", value: "Male"),
                  OptionProps(title: "Female", value: "Female"),
                  OptionProps(title: "LGBT", value: "LGBT"),
                ]),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kMainPinkColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/discover");
                    },
                    child: Center(
                      child: Text("GET START",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
