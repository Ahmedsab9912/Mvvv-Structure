
// we are creating an abstract class for the base api services
abstract class Baseapiservices {
  // we are creating abstract methods for the get, 
  //post, put and delete api calls
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPutApiResponse(String url, dynamic data);
  Future<dynamic> getDeleteApiResponse(String url);
}