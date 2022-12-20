import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'fonts.dart';

enum AniProps { opacity, translateY }

class ToastMessageAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const ToastMessageAnimation(this.child, {this.duration = const Duration(seconds: 5)});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.translateY, Tween(begin: -100.0, end: 0.0), Duration(milliseconds: 500), Curves.easeOut)
      ..add(AniProps.translateY, Tween(begin: 0.0, end: 0.0), duration)
      ..add(AniProps.translateY, Tween(begin: 0.0, end: -100.0), Duration(milliseconds: 250), Curves.easeIn)
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0), Duration(milliseconds: 500))
      ..add(AniProps.opacity, Tween(begin: 1.0, end: 1.0), duration)
      ..add(AniProps.opacity, Tween(begin: 1.0, end: 0.0), Duration(milliseconds: 500));

    return PlayAnimation(
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child,MultiTweenValues animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(offset: Offset(0, animation.get(AniProps.translateY)), child: child),
      ),
    );
  }
}

enum ToastType {
  info,
  succeed,
  warning,
  danger
}

extension ToastTypeExtension on ToastType {

  Color get color {
    switch (this) {
      case ToastType.succeed:
        return TnexColor.green900;
      case ToastType.danger:
        return TnexColor.red900;
      case ToastType.warning:
        return TnexColor.orange900;
      case ToastType.info: return TnexColor.blue900;
    };
  }

  String get iconName {
    switch (this) {
      case ToastType.succeed:
        return "assets/ic_check_done_circle.png";
      case ToastType.danger:
        return "assets/ic_info.png";
      case ToastType.warning:
        return "assets/ic_warning.png";
      case ToastType.info: return "assets/ic_check_done_circle.png";
    };
  }
}

class ToastUtils {

  static void showMessageToast(BuildContext context, String message, {required ToastType type, Duration second = const Duration(seconds: 3)}) {
    OverlayEntry? _overlayEntry;
    bool isRemoved = false;
    _overlayEntry = createToastOverlay(context, message, second, type: type, closeCallback: () {
      isRemoved = true;
      _overlayEntry?.remove();
    });
    Overlay.of(context)?.insert(_overlayEntry);
    Future.delayed(second, () {
      if (_overlayEntry != null && isRemoved == false) {
        _overlayEntry.remove();
      }
    });
  }

  static OverlayEntry createToastOverlay(BuildContext context,
      String message, Duration second, {required ToastType type, VoidCallback? closeCallback}) {
    return OverlayEntry(
        builder: (context) => Positioned(
          top: 50.0,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          child: ToastMessageAnimation(Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  color: type.color,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  children: [
                    Image.asset(
                      type.iconName,
                      package: "tnex_design_system",
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              message,
                              textAlign: TextAlign.center,
                              // softWrap: true,
                              style: textStyle(TnexTypography.body14Med),
                              maxLines: 2
                          ),
                        )),
                    IconButton(
                      icon: Image.asset("assets/ic_close.png", package: "tnex_design_system",
                        height: 24, width: 24, color: TnexColor.white,),
                      onPressed: closeCallback,
                    )
                  ]
              ),
            ),
          ), duration: second,),
        ));
  }
}