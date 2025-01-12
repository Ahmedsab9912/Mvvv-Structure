import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_arc/data/app_exception.dart';
import 'package:mvvm_arc/data/network/baseApiServices.dart';

class NetworkApiService extends Baseapiservices {
  // This method is used to make a delete api call
  @override
  Future getDeleteApiResponse(String url) async{
    dynamic responseJson;
    try {
      Response response =
         await  http.delete(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

// This method is used to make a get api call
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

// This method is used to make a post api call
  @override
  Future getPostApiResponse(String url, dynamic data)async {
     dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
         body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

// This method is used to make a put api call
  @override
  Future getPutApiResponse(String url, dynamic data)async {
    dynamic responseJson;
    try {
      Response response = await put(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


// This method is used to return the response based 
//on the status code
  dynamic returnResponse (http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode.toString()}');
    }
  }

}
