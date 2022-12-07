
import 'package:flutter/material.dart';
import '/model/color_model.dart';
import '/model/typography_model.dart';
import '/main.dart';
import '/screen/item_list.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/components/appbar.dart';
import 'color_drop_down.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TypographyModel>? itemList;
  Color color = TnexColor.primary;

  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
      appBar: TnexAppBar(
        title: 'Template',
      ),
      body: Container(
        child: Column(
      children:[
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonExample((_color) {
            setState(() {
                color = _color;
            });
          })
        ),
        SizedBox(height: 20),
        Expanded(
        child: _gridView()),
      ]
    ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 18.0 / 9.0,
      children: itemList!
          .map(
            (item) => ItemList(item),
          )
          .toList(),
    );
  }

  List<TypographyModel> _itemList() {
    return [
      TypographyModel(typoType: TnexTypography.heading1, color: color),
      TypographyModel(typoType: TnexTypography.heading2, color: color),
      TypographyModel(typoType: TnexTypography.heading3, color: color),
      TypographyModel(typoType: TnexTypography.heading4, color: color),
      TypographyModel(typoType: TnexTypography.heading5, color: color),
      TypographyModel(typoType: TnexTypography.heading6, color: color),
      TypographyModel(typoType: TnexTypography.body18Semi, color: color),
      TypographyModel(typoType: TnexTypography.body18Med, color: color),
      TypographyModel(typoType: TnexTypography.body18Reg, color: color),
      TypographyModel(typoType: TnexTypography.body16Semi, color: color),
      TypographyModel(typoType: TnexTypography.body16Med, color: color),
      TypographyModel(typoType: TnexTypography.body16Reg, color: color),
      TypographyModel(typoType: TnexTypography.body14Semi, color: color),
      TypographyModel(typoType: TnexTypography.body14Med, color: color),
      TypographyModel(typoType: TnexTypography.body14Reg, color: color),
      TypographyModel(typoType: TnexTypography.body12Semi, color: color),
      TypographyModel(typoType: TnexTypography.body12Med, color: color),
      TypographyModel(typoType: TnexTypography.body12Reg, color: color),
    ];
  }
}
