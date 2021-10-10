import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleStatus extends StatelessWidget {
  final IconData icon ;
  final Color color;
  final Function onTap;
  const CircleStatus({Key? key,required this.icon,required this.color,required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call();
      },
      child: Container(
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
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
// class CircleStatus extends StatefulWidget {
//   const CircleStatus({Key? key}) : super(key: key);

//   @override
//   _CircleStatusState createState() => _CircleStatusState();
// }

// class _CircleStatusState extends State<CircleStatus> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(999),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: Icon(Icons.close, color: Colors.red),
//           ),
//         ),
//         SizedBox(width: 20),
//         Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(999),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: GestureDetector(
//               onTap: (){
//                Get.toNamed("/profile");
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.expand_less, color: Colors.purple),
//               ),
//             )),
//         SizedBox(width: 20),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(999),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: Icon(
//               Icons.favorite,
//               color: Colors.red[300],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
