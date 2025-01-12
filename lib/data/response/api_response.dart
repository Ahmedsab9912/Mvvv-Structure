import 'package:mvvm_arc/data/response/status.dart';

// ApiResponse class
class ApiResponse<T> {
  // Status variable
  Status? status;
  T? data;
  String? message;

// ApiResponse constructor
  ApiResponse(this.status, this.data, this.message);

// ApiResponse named constructors
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.message) : status = Status.ERROR;

// Overriding the toString method to return the
// status, message, and data
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}