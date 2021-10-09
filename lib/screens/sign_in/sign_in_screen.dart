import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContainer(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 36),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: size.width * 0.5,
                  ),
                  SizedBox(
                    height: 48,
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
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text("forgot password ?"),
                      )
                    ],
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
                            "SIGN IN",
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
                Get.toNamed("/sign_up");
              },
              child: Container(
                color: kMainPurpleColor,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign up here!",
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
