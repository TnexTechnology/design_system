
import 'package:flutter/material.dart';
import '/model/color_model.dart';
import 'package:tnex_design_system_example/constant/tnex_icon.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';


class DropdownButtonExample extends StatefulWidget {


  final Function(Color) colorSelectedCallback;

  const DropdownButtonExample(this.colorSelectedCallback, {Key? key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  ColorModel? dropdownValue = null;

  final List<ColorModel> list = [
      ColorModel(name: "Primary", color: TnexColor.primary),
      ColorModel(name: "Primary 900", color: TnexColor.primary900),
      ColorModel(name: "Primary 800", color: TnexColor.primary800),
      ColorModel(name: "Primary 700", color: TnexColor.primary700),
      ColorModel(name: "Primary 600", color: TnexColor.primary600),
      ColorModel(name: "grey 900", color: TnexColor.grey900),
      ColorModel(name: "grey 800", color: TnexColor.grey800),
      ColorModel(name: "grey 700", color: TnexColor.grey700),
      ColorModel(name: "grey 600", color: TnexColor.grey600),
      ColorModel(name: "blue 900", color: TnexColor.blue900),
      ColorModel(name: "blue 800", color: TnexColor.blue800),
      ColorModel(name: "blue 700", color: TnexColor.blue700),
      ColorModel(name: "blue 600", color: TnexColor.blue600),
      ColorModel(name: "yellow 900", color: TnexColor.yellow900),
      ColorModel(name: "yellow 800", color: TnexColor.yellow800),
      ColorModel(name: "yellow 700", color: TnexColor.yellow700),
      ColorModel(name: "yellow 600", color: TnexColor.yellow600),

  ];  

  @override
  Widget build(BuildContext context) {
    if (dropdownValue == null) {
      dropdownValue = list[0];
    }
    return DropdownButton<ColorModel>(
      value: dropdownValue,
      icon: Image.asset(TnexIcon.bubble),
      elevation: 16,
      style: const TextStyle(color: TnexColor.red900),
      onChanged: (ColorModel? value) {
        // This is called when the user selects an item.
        setState(() {
          if (value != null) {
            dropdownValue = value;
            widget.colorSelectedCallback(value.color);
          }
        });
      },
      items: list.map<DropdownMenuItem<ColorModel>>((ColorModel color) {
        return DropdownMenuItem<ColorModel>(
          value: color,
          child: Container(
            padding: EdgeInsets.all(14.0),
            child: Text(color.name, style: textStyle(TnexTypography.body14Semi, color: Colors.black)),
          ),
        );
      }).toList(),
    );
  }
}