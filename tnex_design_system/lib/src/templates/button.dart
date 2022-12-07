import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
import './bouncing_anim.dart';
import '/src/colors.dart';

class MSBBackButton extends StatelessWidget {
  final Function? onPressed;

  const MSBBackButton(
      {Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MSBBouncingAnim(
        child: Center(
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: TnexColor.gray900,
                borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Image.asset("assets/ic_arrow.png",
                    package: "tnex_design_system",
                    width: 16, height: 16)
            ),
          ),
        ),
        onPressed: onPressed);
  }
}