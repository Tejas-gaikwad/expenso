import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarWidget extends StatelessWidget {
  final void Function(DateRangePickerSelectionChangedArgs)? onDateSelected;
  const CalendarWidget({super.key, this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      backgroundColor: Colors.transparent,
      onSelectionChanged: onDateSelected,
      selectionMode: DateRangePickerSelectionMode.single,
      initialSelectedDate: DateTime.now(),
      allowViewNavigation: true,
    );
  }
}
