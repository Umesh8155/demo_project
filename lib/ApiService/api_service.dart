import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:demo_project/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart' as dio;

class URLS {
  static const String BASE_URL = "https://yogameditation.mycodelibraries.com/api/data/";
  static const String get_yoga_tips_URL = "${BASE_URL}get_yoga_tips.php";

  static const updatePrifile = 'https://yogameditation.mycodelibraries.com/api/data/drivers';
}

class ApiService {
  static final ApiService _api = ApiService._internal();

  factory ApiService() {
    return _api;
  }

  ApiService._internal();


  static Future postApiCallArgs({String url, var apiRequest}) async {
    var client = http.Client();
    try {
      print("called ----->  $url");
      debugPrint("apiRequest  $apiRequest");

      final uriResponse = await client.post(Uri.parse(url),
          body: json.encode(apiRequest),
          headers: {'Content-type': 'application/json',
            'Authorization': 'sK1I0sTp1uwPPlrrHqLmk4XXQmtvtRdt71FFD'});

      debugPrint("apiResponse : ${jsonDecode(uriResponse.body)}");
      if (uriResponse.statusCode == 200) {
        return jsonDecode(uriResponse.body);
      } else if (uriResponse.statusCode == 400) {
        showToast("${jsonDecode(uriResponse.body)["message"]}");
        return null;
      } else {
        showToast("Something went wrong");
        return null;
      }
    } catch (e) {
      if (e is SocketException) {
        showToast("please check your internet connection");
      } else if (e is TimeoutException) {
        showToast("Timeout exception: ${e.toString()}");
      }
      return null;
    }
  }

  static Future<Map<String, dynamic>> updateProfile(var updateProfileRequest,String authToken,String DeviceID, BuildContext context) async {

    try {
      print('updateProfileRequest : $updateProfileRequest');
      var dioRequest=dio.Dio();
      dioRequest.options.baseUrl=URLS.updatePrifile;
      dioRequest.options.headers={'authorization': '${authToken}','deviceid': '${DeviceID}'};

      final uriResponse = await dioRequest.post(URLS.updatePrifile,
        data: updateProfileRequest,);

      debugPrint("updateProfileResponse : ${jsonDecode(uriResponse.toString())}");
      if (uriResponse.statusCode == 200) {
        return jsonDecode(uriResponse.toString());
      } else if (uriResponse.statusCode == 401) {
        // PreferenceUtils.clearSharedPreferences();
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        return null;
      }
    } catch (e) {
      try {
        if (e is SocketException) {
          showToast("please check your internet connection");
        } else if (e is TimeoutException) {
          showToast("Timeout exception: ${e.toString()}");
        } else if (e.response.statusCode==401) {
         /* PreferenceUtils.clearSharedPreferences();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage()));*/
        }
      } on Exception catch (e) {
        // TODO
      }
      return null;
    }
  }

}