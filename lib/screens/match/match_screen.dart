import 'package:flirtii/configs/constants.dart';
import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kMainPurpleColor,
            kMainPinkColor,
          ],
        )),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: size.height * 0.1,
                  left: 50,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dXNlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  right: 50,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150 + (size.height * 0.1) + 75,
                  // right: size.width / 2,
                  child: Column(
                    children: [
                      Text(
                        "It’s a Match",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You and Elvis have liked each other",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 35,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 48),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Start Chating",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Dismiss",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ],
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
