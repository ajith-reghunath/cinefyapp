import 'package:get_time_ago/get_time_ago.dart';

class TimeDisplay {
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
}
