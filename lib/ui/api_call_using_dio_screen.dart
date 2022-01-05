import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiCallUsingDIOScreen extends StatefulWidget {
  const ApiCallUsingDIOScreen({Key key}) : super(key: key);

  @override
  _ApiCallUsingDIOScreenState createState() => _ApiCallUsingDIOScreenState();
}

class _ApiCallUsingDIOScreenState extends State<ApiCallUsingDIOScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Call Using DIO"),
      ),
    );
  }



  // updateProfile() async {
  //   //if (profileImage == null) {
  //   //  showToast(context, "Please select profile image");
  //   //} else
  //   if (nameController.text == "") {
  //     showToast(context, "Please enter name");
  //   } else if (mobileNoController.text == "") {
  //     showToast(context, "Please enter Mobile No");
  //   } else if (addressController.text == "") {
  //     showToast(context, "Please enter address");
  //   } else if (cityController.text == "") {
  //     showToast(context, "Please enter city name");
  //   } else if (stateController.text == "") {
  //     showToast(context, "Please enter state name");
  //   } else if (pincodeController.text == "") {
  //     showToast(context, "Please enter pincode");
  //   } else if (designationController.text == "") {
  //     showToast(context, "Please enter designation");
  //   } else if (vehicalNoController.text == "") {
  //     showToast(context, "Please enter vehicle no");
  //   } else {
  //     String UserId = PreferenceUtils.getString("UserId");
  //
  //     _dialog.show(message: "Loading...");
  //
  //     var formData;
  //     if (profileImage == null) {
  //       formData = FormData.fromMap({
  //         'Id': UserId,
  //         'FirstName': nameController.text,
  //         'LastName': "",
  //         'EmailAddress': emailController.text,
  //         'RoleId': RoleId,
  //         'MobileNumber': mobileNoController.text,
  //         'Designation': designationController.text,
  //         'Address': addressController.text,
  //         'City': cityController.text,
  //         'State': stateController.text,
  //         'Zip': pincodeController.text,
  //         //'DOB': DOB,
  //         //'Image': profileImage==null?null:await MultipartFile.fromFile(profileImage.path, filename: 'podImage.png'),
  //         'VehicleNumber': vehicalNoController.text,
  //       });
  //     } else {
  //       formData = FormData.fromMap({
  //         'Id': UserId,
  //         'FirstName': nameController.text,
  //         'LastName': "",
  //         'EmailAddress': emailController.text,
  //         'RoleId': RoleId,
  //         'MobileNumber': mobileNoController.text,
  //         'Designation': designationController.text,
  //         'Address': addressController.text,
  //         'City': cityController.text,
  //         'State': stateController.text,
  //         'Zip': pincodeController.text,
  //         //'DOB': DOB,
  //         'Image': await MultipartFile.fromFile(profileImage.path,
  //             filename: 'podImage.png'),
  //         'VehicleNumber': vehicalNoController.text,
  //       });
  //     }
  //
  //     /*var formData = FormData.fromMap({
  //       'Id': 26,
  //       'FirstName': "umesh",
  //       'LastName': "Katariya",
  //       'emailaddress': "uk@gmail.com",
  //       'RoleId': "2 ",
  //       'MobileNumber': "8155949294",
  //       'Designation': "bca",
  //       'Address': "surat",
  //       'City': "surat",
  //       'State': "surat",
  //       'Zip': "123456",
  //       'DOB': "null",
  //       'Image': null,
  //       'VehicleNumber': "gj05qw1234",
  //     });*/
  //
  //     List request = [];
  //     request.add(formData);
  //
  //     debugPrint("request : $request");
  //
  //     String authToken = PreferenceUtils.getString("AuthToken");
  //     String DeviceID = PreferenceUtils.getString("DeviceID");
  //
  //     await checkInternet().then((internet) async {
  //       if (internet != null && internet) {
  //         await ApiService.updateProfile(formData, authToken, DeviceID, context)
  //             .then((value) {
  //           if (value == null) {
  //             showToast(context, "Something went wrong");
  //           } else {
  //             if (value["success"] == true) {
  //               showToast(context, "Profile Update Successfully");
  //             } else {
  //               showToast(context, "Something went wrong");
  //             }
  //           }
  //         });
  //       } else {
  //         showToast(context, "please check your internet connection");
  //       }
  //     });
  //     _dialog.hide();
  //   }
  // }
}
