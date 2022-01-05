import 'package:demo_project/ui/api_call_screen.dart';
import 'package:demo_project/ui/api_call_using_dio_screen.dart';
import 'package:demo_project/ui/state_full_builder_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
      builder: () {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: HomePage(),
        );
      }
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example"),),
      body: bodyView(),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyView(){
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          SizedBox(height: 10.h,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiCallScreen()));
          }, child: Text("API Call Using HTTP")),
          SizedBox(height: 10.h,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiCallUsingDIOScreen()));
          }, child: Text("API Call Using DIO")),
          SizedBox(height: 10.h,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StateFullBuilderDialogScreen()));
          }, child: Text("State full builder dialog")),
        ],
      ),
    );
  }
}

