import 'package:flutter/material.dart';

import '../shared/utils.dart' show CalendarFormat;

class FormatButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: DropdownButton<String>(
          value: newValue,
          elevation: 0,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 1,
            color: Colors.blue,
          ),
          onChanged: (String? newValue) {

            print("rohannn:: ${newValue}");
            if (newValue == "Week") {
              // availableCalendarFormats[CalendarFormat.week];
              onTap(_nextFormat(CalendarFormat.week));
            } else if (newValue == "2 Week") {
              // availableCalendarFormats[CalendarFormat.twoWeeks];
              onTap(_nextFormat(CalendarFormat.twoWeeks));
            } else if (newValue == "Month") {
              // availableCalendarFormats[CalendarFormat.month];
              onTap(_nextFormat(CalendarFormat.month));
            }



            // setState(() {
            //   dropdownValue = newValue!;
            // });

          },
          items: <String>['Week', '2 Week', 'Month']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
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
  //     ? availableCalendarFormats[_nextFormat()]!
  //     : availableCalendarFormats[calendarFormat]!;

  CalendarFormat _nextFormat(CalendarFormat calendarFormat) {
    final formats = availableCalendarFormats.keys.toList();
    int id = formats.indexOf(calendarFormat);
    //id = (id) % formats.length;
    return formats[id];
  }
}
