import 'package:demo_project/ui/api_call_screen.dart';
import 'package:demo_project/ui/api_call_using_dio_screen.dart';
import 'package:demo_project/ui/state_full_builder_dialog_screen.dart';
import 'package:demo_project/utils/app_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('gu', 'IN'),
        Locale('hi', 'IN')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: HomePage(),
          );
        });
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
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: bodyView(),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyView() {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 10.h,
          ),
          PopupMenuButton(
              child: Container(
                color: primaryColor,
                height: 40.sp,
                alignment: Alignment.center,
                child: Text("Change Language",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),),
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("English"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Hindi"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("Gujarati"),
                      value: 3,
                    ),
                  ],
            onSelected: (value) {
              if(value==1){
                context.locale = Locale('en', 'US');
              }else if(value==2){
                context.locale = Locale('hi', 'IN');
              }else if(value==3){
                context.locale = Locale('gu', 'IN');
              }
              setState(() {

              });
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiCallScreen()));
              },
              child: Text("Current Language : " + tr("language"))),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiCallScreen()));
              },
              child: Text("API Call Using HTTP")),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApiCallUsingDIOScreen()));
              },
              child: Text("API Call Using DIO")),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateFullBuilderDialogScreen()));
              },
              child: Text("State full builder dialog")),
        ],
      ),
    );
  }
}
