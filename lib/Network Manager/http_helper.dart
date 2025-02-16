// import 'dart:convert';
// import 'dart:io';
//
// import '../Helper/storage_helper.dart';
// import '../Routes/routes_name.dart';
// import 'api_exceptions.dart';
//
// class HttpHelper {
//   static final HttpHelper _getInstance = HttpHelper._internal();
//
//   HttpHelper._internal();
//
//   factory HttpHelper() {
//     return _getInstance;
//   }
//
//   Map<String, String> header (bool isRequireAuthorization) {
//     if(isRequireAuthorization){
//       return {
//         "Content-type": "application/json",
//         "Authorization": 'Bearer ${StorageHelper().getUserBearerToken()}',
//       };
//     }else{
//       return {
//         "Content-type": "application/json",
//       };
//     }
//   }
//
//
//
//   Future<Map<String, dynamic>> get({required String url, bool isRequireAuthorization = false}) async {
//     Map<String, dynamic> responseData;
//
//     try {
//       final apiResponse = await http.get(Uri.parse(url), headers: header(isRequireAuthorization));
//
//       printValue(url ,tag: "API GET URL: ",);
//       printValue(header(isRequireAuthorization) ,tag: "API Header: ",);
//       printValue(apiResponse.body ,tag: "API RESPONSE",);
//
//       responseData = _returnResponse(response: apiResponse);
//     } on SocketException {
//       Map<String, dynamic> responseData = {};
//       return responseData;
//     }
//     return responseData;
//   }
//
//
//
//
//   Future<Map<String, dynamic>> post(
//       {required String url,
//         String body ='',
//         bool isRequireAuthorization = false}) async {
//
//
//     Map<String, dynamic> responseData;
//
//     try {
//       final apiResponse = await http.post(Uri.parse(url), body: body, headers: header(isRequireAuthorization));
//
//       printValue(url ,tag: "API POST URL: ",);
//       printValue(body ,tag: "API REQ BODY: ",);
//       printValue(header(isRequireAuthorization) ,tag: "API Header: ",);
//       printValue(apiResponse.body ,tag: "API RESPONSE",);
//
//       responseData = _returnResponse(response: apiResponse);
//     } on SocketException {
//       Map<String, dynamic> responseData = {};
//       return responseData;
//     }
//
//     return responseData;
//   }
//
//
//
// }
//
// Map<String, dynamic> _returnResponse({required http.Response response}) {
//   switch (response.statusCode) {
//     case 200:
//       var responseJson =
//       json.decode(response.body.toString()) as Map<String, dynamic>;
//       return responseJson;
//
//     case 201:
//       var responseJson =
//       json.decode(response.body.toString()) as Map<String, dynamic>;
//       return responseJson;
//
//     case 400:
//       var decodeError = json.decode(response.body.toString()) as Map<String, dynamic>;
//       toastMessage(decodeError['message'].toString());
//       throw BadRequestException(response.body.toString());
//
//     case 401:
//       StorageHelper().clear(routeName: RouteName.logIn);
//       var errorResponse = ApiErrorResponseModel(
//           success: false,
//           message: "authorized 401",
//           );
//
//      throw UnauthorisedException(json.encode(errorResponse));
//
//     case 403:
//       throw InvalidInputException(response.body.toString());
//
//     case 404:
//       throw BadRequestException(response.body.toString());
//
//     case 500:
//       var errorResponse = ApiErrorResponseModel(
//           success: false,
//           message: "Error occurred while Communication with Server with StatusCode 500",);
//       toastMessage(errorResponse.message??'');
//       throw FetchDataException(json.encode(errorResponse));
//
//     default:
//       var errorResponse = ApiErrorResponseModel(
//           success: false,
//           message: "Error occurred while Communication with Server with StatusCode ${response.statusCode}",);
//       toastMessage(errorResponse.message??'');
//       throw FetchDataException(json.encode(errorResponse));
//   }
// }
//
