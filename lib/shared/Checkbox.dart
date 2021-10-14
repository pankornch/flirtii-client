import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/shared/RadioGroup.dart';
import 'package:flutter/material.dart';

class SharedCheckBox extends StatefulWidget {
  final List<OptionProps> options;
  final String? title;
  final Function? onChange;

  const SharedCheckBox({
    Key? key,
    this.title,
    required this.options,
    this.onChange,
  }) : super(key: key);

  @override
  _SharedCheckBoxState createState() => _SharedCheckBoxState();
}

class _SharedCheckBoxState extends State<SharedCheckBox> {
  List<int> selected = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Column(
                children: [
                  Text(widget.title!,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            : SizedBox(),
        GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 4,
          crossAxisCount: 3,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            for (var i = 0; i < widget.options.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selected.contains(i)) {
                      selected.removeWhere((el) => el == i);
                    } else {
                      selected.add(i);
                    }
                    widget.onChange
                        ?.call(selected.map((e) => widget.options[e]).toList());
                  });
                },
                child: Row(
                  children: [
                    selected.contains(i)
                        ? Icon(Icons.check_box, color: kMainPinkColor)
                        : Icon(Icons.check_box_outline_blank),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.options[i].title),
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }
}
