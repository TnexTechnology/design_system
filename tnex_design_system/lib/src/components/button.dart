
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';

import '../colors.dart';

class TnexBackButton extends StatelessWidget {
  final String? imgPath;
  final Function()? onPressed;

  const TnexBackButton({Key? key, required this.onPressed, this.imgPath}) : super(key: key);

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
                child: Image.asset(imgPath ?? "assets/images/ic_arrow.png",
                    package: "tnex_design_system",
                    width: 16, height: 16)),
          ),
        ),
        onPressed: onPressed);
  }
}

class MSBBouncingAnim extends StatefulWidget {
  MSBBouncingAnim(
      {required this.onPressed,
        required this.child,
        this.scaleBegin = 1,
        this.scaleEnd = 1.1,
        this.durationMS = 25,
        this.coolDownMS = 600});

  final double scaleBegin;
  final double scaleEnd;
  final int durationMS;
  final int coolDownMS;
  final Function()? onPressed;
  final Widget child;

  @override
  State createState() => MSBBouncingAnimState();
}

class MSBBouncingAnimState extends State<MSBBouncingAnim>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  late Animation<double> animation;
  bool isPressed = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 50,
      ),
    )..addListener(() {
      setState(() {});
    });
    Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
      reverseCurve: const Cubic(.21, 1.53, .75, 1.78),
    );

    animation =
        Tween(begin: widget.scaleBegin, end: widget.scaleEnd).animate(curve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (!_controller.isCompleted)
      _waitAnimDoneAndUp();
    else
      _controller.reverse();
  }

  Future<void> _waitAnimDoneAndUp() async {
    while (!_controller.isCompleted) {
      await new Future.delayed(new Duration(milliseconds: widget.durationMS));
    }
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = animation.value;
    return GestureDetector(
        onTap: _onButtonPressed,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        behavior: HitTestBehavior.opaque,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }

  Future<void> _onButtonPressed() async {
    if (!isPressed) {
      isPressed = true;
      if (widget.coolDownMS > 0)
        await Future.delayed(new Duration(milliseconds: (widget.coolDownMS/12).round()));
        if (widget.onPressed != null)
          widget.onPressed!();
      if (widget.coolDownMS > 0)
        await Future.delayed(new Duration(milliseconds: widget.coolDownMS));
      isPressed = false;
    }
  }
}