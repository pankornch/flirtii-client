import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/services/dateFormat.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String? title;
  final String? value;
  final Function? onChange;

  const DatePicker({
    Key? key,
    this.title,
    this.value,
    this.onChange,
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2010),
          lastDate: DateTime(2025),
        );

        if (selected != null && selected != selectedDate) {
          widget.onChange?.call(selected);
          setState(() {
            selectedDate = selected;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Column(
                  children: [
                    Text("Date of Birth",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : SizedBox(),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: kMainPinkColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(DateFormat(selectedDate).dateToString()),
            ],
          ),
        ],
      ),
    );
  }
}
