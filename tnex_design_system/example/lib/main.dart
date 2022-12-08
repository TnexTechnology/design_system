import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '/constant/constant.dart';
import '/screen/home_main.dart';
import '/screen/splash_screen.dart';
import 'package:tnex_design_system/src/colors.dart';


void main() => runApp(GetMaterialApp(
    title: 'GridView Demo',
    debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,
    accentColor: TnexColor.background,
  ),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
      HOME_SCREEN: (BuildContext context) => HomeMainScreen(),
      //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
    },
    home: SplashScreen(),));
