/// Custom exception class to handle errors
class AppException implements Exception {
  /// The error message
  final String message;

  /// Constructor for custom exception class
  AppException(this.message);

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
