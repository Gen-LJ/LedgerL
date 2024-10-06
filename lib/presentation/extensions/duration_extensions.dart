/// Extension methods for [Duration] class object
extension DurationExtensions on Duration {
  /// Method to convert a duration into a String format like "00:00:00".
  /// The hours will be reduced if less than 0.
  String convertDurationToString() {
    String value = '';
    final hours = inHours;
    if (hours > 0) {
      value = '$hours:';
    }
    final minutes = inMinutes % 60;

    value = value.isNotEmpty
        ? "$value${'$minutes'.padLeft(2, '0')}:"
        : "${'$minutes'.padLeft(1, '0')}:";

    final seconds = inSeconds % 60;
    value = value.isNotEmpty
        ? "$value${'$seconds'.padLeft(2, '0')}"
        : '$seconds'.padLeft(2, '0');
    return value;
  }
}
