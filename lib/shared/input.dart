import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;

  Input({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.prefixIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        controller: controller,
        obscureText: obscureText == null ? false : obscureText!,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
