import 'package:demo_project/ApiService/api_service.dart';
import 'package:demo_project/utils/app_utils.dart';
import 'package:demo_project/utils/loading_dialog.dart';
import 'package:flutter/material.dart';

class ApiCallScreen extends StatefulWidget {
  const ApiCallScreen({Key key}) : super(key: key);

  @override
  _ApiCallScreenState createState() => _ApiCallScreenState();
}

class _ApiCallScreenState extends State<ApiCallScreen> {

  List yogaTipsList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      getYogaTipsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Call Using HTTP"),
      ),
    );
  }


  getYogaTipsList() async {
    showLoader(context);

    Map<String, dynamic> signUpRequest = {

    };

    await check().then((internet) async {
      if (internet != null && internet) {
        await ApiService.postApiCallArgs(
            url: URLS.get_yoga_tips_URL, apiRequest: signUpRequest)
            .then((value) {
          Navigator.pop(context);
          if (value == null) {
            // showToast("Something went wrong");
          } else {
            if (value["status"].toString().toLowerCase() == "true") {
              yogaTipsList.clear();
              yogaTipsList.addAll(value["data"]);
              setState(() {

              });
            } else {
              showToast(value["message"]);
            }
          }
        });
        // Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showToast("please check your internet connection");
      }
    });
  }

}
