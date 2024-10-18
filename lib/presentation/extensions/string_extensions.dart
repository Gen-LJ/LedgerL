extension StringX on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String maskEmail() {
    List<String> parts = split('@');
    String username = parts[0];
    String domain = '@${parts[1]}';
    if (username.length <= 3) {
      return username + domain;
    }
    String masked =
        '*' * (username.length - 3) + username.substring(username.length - 3);
    return masked + domain;
  }

  String maskAndShowLastFour() {
    if (length <= 4) {
      return this;
    }

    String masked = '*' * (length - 4) + substring(length - 4);

    return masked;
  }
}
