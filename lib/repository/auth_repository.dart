import 'package:flutter/foundation.dart';
import 'package:mvvm_arc/data/network/baseApiServices.dart';
import 'package:mvvm_arc/data/network/networkApiServices.dart';
import 'package:mvvm_arc/res/app_url.dart';

// we are creating a class for the auth repository
class AuthRepository {
// this technique is called dependency injection
  final Baseapiservices _apiServices = NetworkApiService();

// this method is used to make a post api call
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
          return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

// this method is used to make a post api call
    Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
          return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}
