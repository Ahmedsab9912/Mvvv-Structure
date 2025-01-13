import 'package:mvvm_arc/data/network/baseApiServices.dart';
import 'package:mvvm_arc/data/network/networkApiServices.dart';

// we are creating a class for the auth repository
class AuthRepository {

// this technique is called dependency injection
 final Baseapiservices _apiServices = NetworkApiService();
 

}