extension DateTimeHelpers on DateTime {
  String get getDateWithMonthName {
    Map<int, String> months = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "July",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    return "$day ${months[month]} $year";
  }
}
