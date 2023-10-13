import 'package:get_time_ago/get_time_ago.dart';

class TimeDisplay {
  final Map<int, String> monthNames = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  String getTime(String time) {
    String finalResult;
    var convertedTimestamp = DateTime.parse(time);
    var result = GetTimeAgo.parse(convertedTimestamp);

    List<String> parts = result.split(' ');

    if (parts.length >= 3) {
      finalResult = '${parts[0]} ${parts[1]} ${parts[2]}';
    } else {
      finalResult = result;
    }
    return finalResult;
  }

  String getTime2(String time) {
    String finalResult;
    DateTime currentDateTime = DateTime.parse(time).add(const Duration(
      hours: 5,
      minutes: 20,
    ));
    var result = GetTimeAgo.parse(currentDateTime);

    List<String> parts = result.split(' ');

    if (parts.length >= 3) {
      // print('part 0 : ${parts[0]}');
      // print('part 1 : ${parts[1]}');
      // print('part 2 : ${parts[2]}');
      if (parts[1] == 'seconds' ||
          parts[1] == 'minute' ||
          parts[1] == 'minutes' ||
          parts[1] == 'hour' ||
          parts[1] == 'hours' ||
          parts[1] == 'minute') {
        finalResult = '0';
      } else if (parts[1] == 'day') {
        finalResult = '1';
      } else {
        finalResult = '${parts[0]} ${parts[1]} ${parts[2]}';
      }
    } else {
      finalResult = result;
    }
    return finalResult;
  }

  String displayDate(String time) {
    // String finalResult;
    DateTime postedTime = DateTime.parse(time);
    List<String> messageParts = postedTime
        .add(const Duration(hours: 5, minutes: 20))
        .toString()
        .split(' ');
    List<String> currentDateParts = DateTime.now().toString().split(' ');
    List<String> yesterdayDateParts =
        DateTime.now().subtract(const Duration(days: 1)).toString().split(' ');
    if (messageParts[0] == currentDateParts[0]) {
      return 'Today';
    } else if (messageParts[0] == yesterdayDateParts[0]) {
      return 'Yesterday';
    } else {
      return ('${postedTime.day} ${monthNames[postedTime.month]}');
    }
  }

  String displayTime(String inputString) {
    DateTime dateTime =
        DateTime.parse(inputString).add(const Duration(hours: 5, minutes: 30));
    String hour =
        dateTime.hour > 12 ? '${dateTime.hour - 12}' : '${dateTime.hour}';

    String time = dateTime.hour > 12
        ? '${hour.toString()}:${dateTime.minute.toString().padLeft(2, '0')} PM'
        : '${hour.toString()}:${dateTime.minute.toString().padLeft(2, '0')} AM';
    return time;
  }

  String getDate(String inputString) {
    String currentDate = DateTime.parse(inputString)
        .add(const Duration(hours: 5, minutes: 30))
        .toString();
    List<String> parts = currentDate.split(' ');
    return parts[0];
  }
}
