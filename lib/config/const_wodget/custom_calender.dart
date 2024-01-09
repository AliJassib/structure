// import 'package:/config/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CustomCalender extends StatefulWidget {
//   final Function(DateTime, DateTime)? onSelectionChanged;
//   final List<DateTime>? notVactions;

//   final bool Function(DateTime)? vactions;
//   const CustomCalender({super.key, this.onSelectionChanged, this.vactions, this.notVactions});

//   @override
//   State<CustomCalender> createState() => _CustomCalenderState();
// }

// class _CustomCalenderState extends State<CustomCalender> {
//   var key = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       key: key,
//       daysOfWeekHeight: 0,
//       firstDay: DateTime.now(),
//       lastDay: DateTime.now().add(const Duration(days: 365)),
//       focusedDay: focus,
//       currentDay: focus,
//       locale: Get.locale!.languageCode,
//       calendarFormat: CalendarFormat.month,
//       availableCalendarFormats: const {
//         CalendarFormat.month: 's',
//       },
//       // rangeEndDay: DateTime.now().add(const Duration(days: 0)),
//       weekNumbersVisible: false,
//       headerVisible: true,
//       daysOfWeekVisible: true,
//       holidayPredicate: (day) {
//         if (widget.vactions != null) {
//           return widget.vactions!(day);
//         }
//         return true;
//       },
//       enabledDayPredicate: widget.vactions,
//       calendarStyle: CalendarStyle(),
//       calendarBuilders: CalendarBuilders(
//         selectedBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: primary(context),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         },
//         holidayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(1000),
//               // border: Border.all(color: Colors.blue),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: primaryColor),
//             ),
//           );
//         },
//         todayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: primary(context),
//               borderRadius: BorderRadius.circular(1000),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           );
//         },
//         defaultBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.amberAccent),
//             ),
//           );
//         },
//         outsideBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.blue.shade100),
//             ),
//           );
//         },
//         dowBuilder: (context, date) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               date.toString().substring(0, 1),
//               style: TextStyle(color: Colors.yellow),
//             ),
//           );
//         },
//         disabledBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.red.shade100,
//               borderRadius: BorderRadius.circular(1000),
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.red),
//             ),
//           );
//         },
//       ),
//       onDaySelected: (selectedDay, focusedDay) {
//         setState(() {
//           focus = selectedDay;
//         });
//         if (widget.onSelectionChanged != null) {
//           widget.onSelectionChanged!(selectedDay, focusedDay);
//         }
//       },
//       onFormatChanged: (format) {
//         Logger().d(format);
//       },
//     );
//   }

//   DateTime focus = DateTime.now();
// }
