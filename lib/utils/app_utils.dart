import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


const primaryColor = Color(0xffD52868);

showToast(String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}



Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}