import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String>
      _mainHeaders; //storing data locally or converting data to map//
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30); //trying to get data from server
    _mainHeaders = {
      'content-type ':
          ' application/json;charset=UTF-8', //charset =utf-8 is encoding/decoding section that tells how to encode or decode the data//
      'Authorization': 'Bearer $token', //type of token is bearer
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response =
          await get(uri); // saves the date in a object response//
      return response;
    } // to call something  from server
    catch (e) {
      return Response(statusCode: 1,statusText: e.toString());
    } // error if it fails to call something
  }
}
