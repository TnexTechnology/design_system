import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

typedef OnToggleChanged = Future<bool> Function(bool);

class CustomSwitcher extends StatefulWidget {
  bool initValue;
  final OnToggleChanged? onToggleChanged;
  final EdgeInsetsGeometry? padding;
  CustomSwitcher({Key? key, this.initValue = true, this.onToggleChanged, this.padding = const EdgeInsets.all(8)}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CustomSwitcherState();
  }
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  final Duration _duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    const double height = 24.0;
    return GestureDetector(
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        padding: widget.padding,
        child: AnimatedContainer(
          duration: _duration,
          width: 48,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height/2),
              color: widget.initValue ? TnexColor.primary : TnexColor.gray700
          ),
          child: Center(
            child: AnimatedContainer(
              duration: _duration,
              width: 48 - 2,
              height: height - 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height/2),
                color: widget.initValue ? TnexColor.primary : TnexColor.gray900,
              ),
              child: Stack(children: <Widget>[
                AnimatedPositioned(
                  duration: _duration,
                  curve: Curves.easeIn,
                  top: 1,
                  left: widget.initValue ? height : 0.0,
                  right: widget.initValue ? 0.0 : height,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      )
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
      onTap: _onToggleChanged,
    );
  }

  _onToggleChanged() async {
    setState(() => widget.initValue = !widget.initValue);
    if (widget.onToggleChanged == null) {
      return;
    }
    Future.delayed(_duration);
    var ret = await widget.onToggleChanged!(widget.initValue);
    if (ret != true) setState(() => widget.initValue = !widget.initValue);
  }
}