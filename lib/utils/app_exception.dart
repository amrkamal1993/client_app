/// This Dart file defines a set of custom exception classes that can be used
/// to handle different types of exceptions within a Flutter application.
/// These exceptions provide additional context by including a message and an
/// optional error code, making it easier to identify and respond to specific
/// error scenarios.
library;

class AppException implements Exception {
  final String message;  // A message describing the exception.
  final int code;       // An optional error code associated with the exception.

  // Constructor for creating an instance of AppException.
  AppException(this.message, {this.code = 0});

  @override
  String toString() => 'AppException: $message';  // String representation of the exception.
}

// NetworkException is a specific type of AppException for network-related errors.
class NetworkException extends AppException {
  // Constructor for creating an instance of NetworkException.
  NetworkException(super.message, {super.code});
}

// ServerException is a specific type of AppException for server-related errors.
class ServerException extends AppException {
  // Constructor for creating an instance of ServerException.
  ServerException(super.message, {super.code});
}

// ValidationException is a specific type of AppException for validation errors.
class ValidationException extends AppException {
  // Constructor for creating an instance of ValidationException.
  ValidationException(super.message, {super.code});
}
