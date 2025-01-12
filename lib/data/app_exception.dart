//* This class is for handling exceptions in the app.
// It will be used to handle exceptions in the API calls.

// Importing the foundation package
class AppException implements Exception {
  final String? message;
  final String? prefix;

// Constructor
  AppException([this.message, this.prefix]);
// Overriding the toString method to return the message with the prefix
  String toString() {
    return "$prefix$message";
  }
}
// Custom exceptions for handling different types of errors
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message!, "Error During Communication: ");
}
// Custom exceptions for handling different types of errors
class BadRequestException extends AppException {
  BadRequestException([String? message])
   : super(message!, "Invalid Request: ");
}

// Custom exceptions for handling different types of errors
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) 
  : super(message!, "Unauthorised: ");
}