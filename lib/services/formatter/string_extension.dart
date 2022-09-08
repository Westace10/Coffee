// ignore_for_file: unnecessary_this, file_names

extension CapExtension on String {
  String get inCaps {
    return this.isNotEmpty
        ? '${this[0].toUpperCase()}${this.substring(1)}'
        : '';
  }

  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }

  int get quatOfMonth {
    var date = this;

    if (date.month == 1 && date.month <= 3) {
      return 1;
    } else if (date.month >= 4 && date.month <= 6) {
      return 2;
    } else if (date.month >= 7 && date.month <= 9) {
      return 3;
    } else {
      return 4;
    }
  }
}
