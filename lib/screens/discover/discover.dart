import 'dart:ui';

import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/user.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flirtii/screens/discover/widgets/circle_status.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final q = gql(r"""
      query {
        users {
          _id
          email
          bio
          firstName
          nickname
        }
      }
    """);

  int idx = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Query(
      options: QueryOptions(document: q),
      builder: (result, {fetchMore, refetch}) {
        List<User> _users = [];

        final data = result.data?["users"];

        final img = "https://i.pravatar.cc/150?u";
        if (!result.isLoading) {
          for (var u in data) {
            _users.add(User.fromJson(u));
          }
        }

        void nextUser() {
          setState(() {
            idx = (idx + 1) % _users.length;
          });
        }

        return Scaffold(
          body: result.isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
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
                          child: GestureDetector(
                            child: Icon(
                              Icons.notifications,
                              color: kMainPurpleColor,
                            ),
                            onTap: () {
                              Get.toNamed("notifications");
                            },
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
                              children: [
                                Container(
                                  width: size.width * 0.75,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      contentPadding:
                                          EdgeInsets.only(left: 24, bottom: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 55,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 7),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              height: size.height * 0.5,
                              width: 380,
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.network(
                                      index == 0
                                          ? "$img=${_users[idx].id}"
                                          : "$img=${_users[idx].id}${index - 1}",
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                                itemCount: 4,
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
                                filter: ImageFilter.blur(
                                    sigmaX: 50.0, sigmaY: 50.0),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width * 0.5,
                                      child: Text(
                                        "${_users[idx].firstName} (22)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.75 - 75,
                                      child: Text(
                                        _users[idx].bio != null
                                            ? "${_users[idx].bio}"
                                            : "",
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
                                onTap: () {
                                  nextUser();
                                },
                              ),
                              SizedBox(width: 20),
                              CircleStatus(
                                icon: Icons.expand_less,
                                color: Colors.purple,
                                onTap: () {
                                  Get.toNamed("/profile/${_users[idx].id}");
                                },
                              ),
                              SizedBox(width: 20),
                              CircleStatus(
                                icon: Icons.favorite,
                                color: kMainPinkColor,
                                onTap: () {
                                  nextUser();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
