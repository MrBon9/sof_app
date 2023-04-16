import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get toMMMdyyyyHHmm => DateFormat("MMM d, yyyy HH:mm").format(this);

  String get toMMMdyyyy => DateFormat("MMM d, yyyy").format(this);

  String get toyyyyMMddHHmm => DateFormat("yyyyMMdd-HHmm").format(this);

  String get toddMMMyyyy => DateFormat("dd MMM yyyy").format(this);
}

class DurationFormatter {
  static String convertDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
