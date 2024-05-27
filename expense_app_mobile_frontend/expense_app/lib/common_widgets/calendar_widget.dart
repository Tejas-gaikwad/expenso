import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
      selectionMode: DateRangePickerSelectionMode.single,
      initialSelectedRange: PickerDateRange(
          DateTime.now().subtract(const Duration(days: 4)),
          DateTime.now().add(const Duration(days: 3))),
    );
  }
}
