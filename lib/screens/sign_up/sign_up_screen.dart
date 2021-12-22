import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/services/gql/mutation.dart';
import 'package:flirtii/shared/MainCotainer.dart';
import 'package:flirtii/shared/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

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
                    hintText: "First name",
                    labelText: "First name",
                    controller: firstNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Last name",
                    labelText: "Last name",
                    controller: lastNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Email",
                    labelText: "Email",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Password",
                    labelText: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    hintText: "Re-enter Password",
                    labelText: "Re-enter Password",
                    controller: confirmPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Mutation(
                    options: MutationOptions(
                        document: SIGN_UP,
                        onCompleted: (_) {
                          Get.toNamed("/sign_in");
                        }),
                    builder: (runMutaion, _) => GestureDetector(
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
                      onTap: () {
                        runMutaion({
                          "input": {
                            "email": emailController.text,
                            "password": passwordController.text,
                            "confirmPassword": confirmPasswordController.text,
                            "firstName": firstNameController.text,
                            "lastName": lastNameController.text
                          }
                        });
                      },
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
