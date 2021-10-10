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
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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
                child: Icon(Icons.notifications,color: kMainPurpleColor,),
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
                                EdgeInsets.only(left: 10, bottom: 10),
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
                        return Image.network(
                          "https://images.unsplash.com/photo-1633792701226-526f17288218?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80",
                          fit: BoxFit.cover,
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
                top: (size.height * 0.72)-25,
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
                      color: Colors.red[300]!,
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
