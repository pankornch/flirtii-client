import 'dart:ui';

import 'package:flirtii/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flirtii/screens/discover/widgets/circle_status.dart';
import 'package:get/get.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Positioned(
                top: 15,
                right: 0,
                child: Icon(
                  Icons.notifications,
                  color: kMainPurpleColor,
                ),
              ),
              Positioned(
                top: 80,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  height: 40,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.75,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            contentPadding:
                                EdgeInsets.only(left: 24, bottom: 10),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: size.height * 0.5,
                    width: 380,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: 10,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.5 + 40,
                width: size.width * 0.75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                      child: Container(
                        height: 90,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.5 + 40,
                width: size.width * 0.75,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Matylda Navarro (22)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: size.width * 0.75 - 75,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.female,
                        color: kMainPinkColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: (size.height * 0.5) + 75 + 25 + 40,
                child: Row(
                  children: [
                    CircleStatus(
                      icon: Icons.close,
                      color: Colors.red,
                      onTap: () {},
                    ),
                    SizedBox(width: 20),
                    CircleStatus(
                      icon: Icons.expand_less,
                      color: Colors.purple,
                      onTap: () {
                        Get.toNamed("/profile/1");
                      },
                    ),
                    SizedBox(width: 20),
                    CircleStatus(
                      icon: Icons.favorite,
                      color: kMainPinkColor,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
