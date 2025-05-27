import 'package:intl/intl.dart';

String getFormatedTime(int timeStamp) {
  // Convert timestamp to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);

  // Format using intl
  String formattedDate = DateFormat('EEEE MMM d, yyyy, h:mma').format(dateTime);

  return formattedDate;
}
