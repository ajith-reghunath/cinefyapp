import 'package:get_time_ago/get_time_ago.dart';

class CustomMessages implements Messages {
  @override
  String prefixAgo() => '';

  @override
  String suffixAgo() => 'ago';

  @override
  String secsAgo(int seconds) => '$seconds seconds';

  @override
  String minAgo(int minutes) => '1 minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => '1 hour';

  @override
  String hoursAgo(int hours) => '$hours hours';

  @override
  String dayAgo(int hours) => '1 day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String wordSeparator() => ' ';
}