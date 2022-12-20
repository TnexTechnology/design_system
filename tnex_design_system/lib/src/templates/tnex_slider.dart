

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class TnexSlider extends StatefulWidget {
  double value;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;

  TnexSlider({Key? key, this.value = 0, this.activeTrackColor, this.inactiveTrackColor, this.thumbColor}) : super(key: key);

  @override
  State<TnexSlider> createState() => _TnexSliderState();

}

class _TnexSliderState extends State<TnexSlider> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliderTheme(
      data: SliderThemeData(
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: widget.inactiveTrackColor,
          thumbColor: Colors.white,
          thumbShape: CircleThumbShape(thumbColor: widget.thumbColor),
          trackShape: CustomTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
          inactiveTickMarkColor: Colors.transparent,
          activeTickMarkColor: Colors.transparent,
          trackHeight: 8),
      child: Slider(
        value: widget.value,
        min: 0,
        max: 1,
        onChanged: (value) {
          widget.value = value;
          setState(() {});
        },
        thumbColor: Colors.white.withOpacity(0),
      ),
    );
  }
}

typedef OnToggleChanged = Future<bool> Function(bool);

class CircleThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color? thumbColor;

  const CircleThumbShape({
    this.thumbRadius = 10,
    this.thumbColor
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {

    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = thumbColor ?? TnexColor.primary
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}