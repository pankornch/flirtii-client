import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flirtii/screens/discover/widgets/circle_status.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                child: Icon(Icons.notifications),
              ),
              Positioned(
                top: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 150,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 300,
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
                top: size.height * 0.59,
                child: CircleStatus(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
