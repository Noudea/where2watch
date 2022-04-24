/// use to convert between different units
class Converter {
  Converter();

  /// Convert a minute value to a string.
  String convertMinutesToHours(int input) {
    int hours = input ~/ 60;
    int minutes = input % 60;
    return '$hours hours and $minutes minutes';
  }

}