import 'package:flutter/material.dart';

class CircleStatus extends StatefulWidget {
  const CircleStatus({Key? key}) : super(key: key);

  @override
  _CircleStatusState createState() => _CircleStatusState();
}

class _CircleStatusState extends State<CircleStatus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.red),
          ),
        ),
        SizedBox(width: 20),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.expand_less, color: Colors.purple),
            )),
        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite,
              color: Colors.red[300],
            ),
          ),
        ),

        // CircleAvatar(
        //   backgroundColor: Colors.white,

        //   child: Icon(Icons.close, color: Colors.red),
        // ),
        // CircleAvatar(
        //   backgroundColor: Colors.white,
        //   child: Icon(
        //     Icons.expand_less,
        //     color: Colors.purple
        //   ),
        // ),
        // SizedBox(width: 20),
        // CircleAvatar(
        //   backgroundColor: Colors.white,
        //   child: Icon(
        //     Icons.favorite,
        //     color: Colors.red[300],
        //   ),
        // )
      ],
    );
  }
}
