import 'package:intl/intl.dart';

String formatDay(DateTime dateTime) {
  // Format date
  String daySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  final dateFormatter = DateFormat('d');
  final monthYearFormatter = DateFormat('MMMM, yyyy');
  return dateFormatter.format(dateTime) +
      daySuffix(dateTime.day) +
      ' ' +
      monthYearFormatter.format(dateTime);
}

String formatTime(DateTime dateTime) {
  final timeFormatter = DateFormat.jm();
  return timeFormatter.format(dateTime);
}
