import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tnex_design_system/tnex_design_system.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';

import '/constant/constant.dart';
import '/screen/grid_item_details.dart';
import '/screen/home_main.dart';
import '/screen/splash_screen.dart';



void main() => runApp(GetMaterialApp(
    title: 'GridView Demo',
    debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,
    accentColor: Color(0xFF761322),
  ),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
      HOME_SCREEN: (BuildContext context) => HomeMainScreen(),
      //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
    },
    home: SplashScreen(),));


// void main() => runApp(MaterialApp(
//   title: 'GridView Demo',
//   home: SplashScreen(),
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData(
//     primarySwatch: Colors.red,
//     accentColor: Color(0xFF761322),
//   ),
//   routes: <String, WidgetBuilder>{
//     SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
//     HOME_SCREEN: (BuildContext context) => HomeMainScreen(),
//     //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
//   },
// ));


// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await TnexDesignSystem.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on:',
          style: textStyle(TnexTypography.heading1, color: TnexColor.yellow100)),
        ),
      ),
    );
  }
}
