import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mysideyunseok/loginpages/findEmailPage.dart';
import 'package:mysideyunseok/loginpages/finsPswdPage.dart';
import 'package:mysideyunseok/loginpages/loginMainPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/nicknamePage.dart';
import 'package:mysideyunseok/loginpages/signuppages/progressSelectPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/secondeStagePages/setDiseasePage.dart';
import 'package:mysideyunseok/loginpages/signuppages/secondeStagePages/setPersonalInfoPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/selectCancerPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/signUpMainPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/stageSelectPage.dart';
import 'package:mysideyunseok/loginpages/signuppages/userTypeSelectPage.dart';
import 'package:mysideyunseok/myPageScreens/addHealthDataPage.dart';
import 'package:mysideyunseok/myPageScreens/checkPswdPage.dart';
import 'package:mysideyunseok/myPageScreens/healthDataListPage.dart';
import 'package:mysideyunseok/myPageScreens/myPageMain.dart';
import 'package:mysideyunseok/myPageScreens/profileModifyPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Color(0xFF111111),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          //scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xFF3BD7E2),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.white),
      home: CheckPswdPage(),
    );
  }
}
