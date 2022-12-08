import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
import '../fonts.dart';
import './bouncing_anim.dart';
import '/src/colors.dart';
import 'package:get/get.dart';

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
        onPressed: onPressed ?? Get.back);
  }
}

class TopbarButton extends StatelessWidget {
  final Function? onPressed;
  final Widget image;

  const TopbarButton({Key? key, required this.image, this.onPressed})
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
                child: image
            ),
          ),
        ),
        onPressed: onPressed);
  }
}

class TnexButton extends StatelessWidget {
  final Function? onPressed;
  final Color backgroundColor;
  final String? title;
  final TnexButtonStyle style;
  final Widget? icon;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? textColor;

  const TnexButton(
      {Key? key, this.onPressed,
        this.title,
        this.icon,
        this.height = 40,
        this.width,
        this.style = TnexButtonStyle.leftToRight,
        this.borderColor,
        this.textColor,
        this.backgroundColor = TnexColor.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        // style: ButtonStyle(
        //   // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        //   // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 2.0, right: 2)),
        //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //     backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        //     minimumSize: MaterialStateProperty.all<Size>(Size(40, 40)),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(8.0),
        //         )
        //     )
        // ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: backgroundColor,
          minimumSize: Size(40.0, 40.0),
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!, width: 1.5)
          ),
        ),
        child: _mainButton(),
      ),
    );
  }

  Widget _mainButton() {
    if (icon == null && (title?.isNotEmpty ?? false)) {
      //Chi co text
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Text(
            title!,
            style: textStyle(TnexTypography.body14Semi, color: textColor ?? Colors.white)),
      );
    } else {
      if (title?.isEmpty ?? true) {
        return Container(
          child: icon,
        );
      }
    }
    return style == TnexButtonStyle.leftToRight ? _leftToRight() : _rightToLeft();
  }

  Widget _leftToRight() {
    return Container(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            SizedBox(
              width: 8,
            ),
            title != null ?
            Text(
              title!,
              style: textStyle(TnexTypography.body14Semi, color: textColor ?? Colors.white),
            )
                : SizedBox()
          ]
      ),
    );
  }

  Widget _rightToLeft() {
    return Container(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            title != null ?
            Text(
              title!,
              style: textStyle(TnexTypography.body14Semi, color: textColor ?? Colors.white),
            )
                : SizedBox(),

            SizedBox(
              width: 8,
            ),
            icon!,
          ]
      ),
    );
  }
}

enum TnexButtonStyle {
  leftToRight,
  rightToLeft
}