import 'package:intl/intl.dart';

class DateTimeUtility {
  static String getNameOfDay(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    return DateFormat('EEEE').format(dateTime);
  }

  static String getNameOfMonth(String dateString) {
    var inputFormat = DateTime.parse(dateString);
    return DateFormat('MMMM dd, yyyy').format(inputFormat);
  }

  static String convertTimeToFormat(DateTime time) {
    List<String> times = DateFormat.yMEd().add_jms().format(time).split(' ');
    if (times != null && times != []) {
      return '${times[2]} ${times[3]}';
    }
    return '';
  }
}
