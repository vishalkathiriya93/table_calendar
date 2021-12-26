import 'package:flutter/material.dart';

import '../shared/utils.dart' show CalendarFormat;

class FormatButton extends StatefulWidget {
  final CalendarFormat calendarFormat;
  final ValueChanged<CalendarFormat> onTap;
  final TextStyle textStyle;
  final Decoration decoration;
  final EdgeInsets padding;
  final bool showsNextFormat;
  String newValue = "Week";
  final Map<CalendarFormat, String> availableCalendarFormats;

  FormatButton({
    Key? key,
    required this.calendarFormat,
    required this.onTap,
    required this.textStyle,
    required this.decoration,
    required this.padding,
    this.newValue = "Week",
    required this.showsNextFormat,
    required this.availableCalendarFormats,
  }) : super(key: key);

  @override
  State<FormatButton> createState() => _FormatButtonState();
}

class _FormatButtonState extends State<FormatButton> {
  String showValue = "Week";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: DropdownButton<String>(
          value: showValue,
          elevation: 0,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 0,
            color: Colors.blue,
          ),
          onChanged: (String? newValue) {
            if (newValue == "Week") {
              widget.onTap(_nextFormat(CalendarFormat.week));
              setState(() {
                showValue = "Week";
              });
            } else if (newValue == "2 Weeks") {
              widget.onTap(_nextFormat(CalendarFormat.twoWeeks));
              setState(() {
                showValue = "2 Weeks";
              });
            } else if (newValue == "Month") {
              widget.onTap(_nextFormat(CalendarFormat.month));
              setState(() {
                showValue = "Month";
              });
            }
          },
          items: <String>['Week', '2 Weeks', 'Month']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8570F),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Image.asset(
                        value == 'Week'
                            ? "assets/icons/calendar.png"
                            : value == "2 Weeks"
                                ? "assets/icons/calendar1.png"
                                : "assets/icons/calendar3.png",
                      ))),
                  SizedBox(
                    width: 16 / 2,
                  ),
                  Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
    //   GestureDetector(
    //   onTap: () => onTap(_nextFormat()),
    //   child: Container(
    //     decoration: decoration,
    //     padding: padding,
    //     child: Text(
    //       _formatButtonText,
    //       style: textStyle,
    //     ),
    //   ),
    // );
  }

  // String get _formatButtonText => showsNextFormat
  CalendarFormat _nextFormat(CalendarFormat calendarFormat) {
    final formats = widget.availableCalendarFormats.keys.toList();
    int id = formats.indexOf(calendarFormat);
    //id = (id) % formats.length;
    return formats[id];
  }
}
