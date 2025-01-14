import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mvvm_arc/data/app_exception.dart';
import 'package:mvvm_arc/data/network/baseApiServices.dart';

class NetworkApiService extends Baseapiservices {
  // This is the instance of Dio class
  final Dio _dio = Dio();

  // This method is used to make a delete api call
  @override
  Future getDeleteApiResponse(String url) async {
    dynamic responseJson;
    try {
      Response response = await _dio.delete(url).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  // This method is used to make a get api call
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await _dio.get(url).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  // This method is used to make a post api call
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await _dio.post(url, data: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  // This method is used to make a put api call
  @override
  Future getPutApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await _dio.put(url, data: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  // This method is used to return the response based on the status code
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode.toString()}');
    }
  }
}
