import 'package:intl/intl.dart';

class TextHelpers {
  String dayTime(String time) {
    final timeFormatted = DateFormat('h:mm a').format(DateTime.parse(time));
    return timeFormatted;
  }
  String dateformatter(String time) {
  final now = DateTime.now();
  final date = DateTime.parse(time);
  final formatter = DateFormat('EEEE');
  final dateFormatted = formatter.format(date);
  
  String result;
  
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    result = 'Today';
  } else if (date.year == now.year && date.month == now.month && date.day == now.day + 1) {
    result = 'Tomorrow';
  } else {
    result = dateFormatted;
  }
  
  return result; // Output: Saturday (if today is April 1st, 2023)
  }
}
