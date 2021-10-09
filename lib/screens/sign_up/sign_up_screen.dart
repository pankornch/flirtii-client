import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContainer(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Input(
                    hintText: "First Name",
                    labelText: "First Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Last Lame",
                    labelText: "Last Lame",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Email",
                    labelText: "Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Re-enter Password",
                    labelText: "Re-enter Password",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kMainPinkColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/sign_in");
              },
              child: Container(
                color: kMainPurpleColor,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign in!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
