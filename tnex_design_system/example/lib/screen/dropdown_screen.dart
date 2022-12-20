import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tnex_design_system_example/model/home_item_model.dart';
import '/model/color_model.dart';
import '/model/typography_model.dart';
import '/main.dart';
import '/screen/item_list.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/templates/input_dropdown_item.dart';
import 'package:tnex_design_system/src/templates/tnex_bottom_sheet.dart';
import 'bottom_sheet_screen.dart';
import 'color_drop_down.dart';
import 'package:get/get.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({Key? key});

  @override
  State<DropdownScreen> createState() => _DropdownState();
}

class _DropdownState extends State<DropdownScreen> {
  List<TypographyModel>? itemList;
  Color color = TnexColor.primary;
  String currentCity = "Hà Nội";
  bool isDisable = false;
  bool isShowIcon = false;

  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
      backgroundColor: TnexColor.background,
      appBar: TnexAppBar(
        title: 'Dropdown Template',
        onClickBack: Get.back,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
        child: Column(
            children:[
              SizedBox(height: 50,),
              SizedBox(height: 10,),
              InputDropdownItemWithTitle(label: "City", placeHolder: currentCity, state: isDisable ? DropdownState.disable : DropdownState.normal, thumb: isShowIcon ? ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/ic_preview_1.png",
                    height: 16, width: 16),
              ) : null, onTap: () {
                _showBottomSheet(context);
              },),
              SizedBox(height: 10,),
              TnexButton(title: isDisable ? "Enable" : "Disable", onPressed: () {
                setState(() {
                  isDisable = !isDisable;
                });
              },),
              SizedBox(height: 10,),
              TnexButton(title: isShowIcon ? "Hide icon item" : "Show icon item", onPressed: () {
                setState(() {
                  isShowIcon = !isShowIcon;
                });
              },),
            ]

        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) async {
    final HomeItemModel? item = await showMaterialModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.001),
                child: TnexBottomSheet(title: "Title", contentWidget: TermsAndConditionsWidget(onTap: (item) {
                  Navigator.pop(context, item);
                },),),
              )
          ),
    );
    setState(() {
      if (item != null) {
        currentCity = item.name;
      }
    });


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
  final FocusNode inputAddressNode = new FocusNode();
  final TextEditingController inputAddress = new TextEditingController();
  Widget buildInputAddress() {
    return Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
        margin: EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
        decoration: BoxDecoration(
          color: TnexColor.gray900,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: TnexColor.primary,
            width: 1,
          ),
        ),
        child: Stack(children: [
          Column(children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                child: Text("City", style: textStyle(TnexTypography.body12Med, color: TnexColor.gray500))),
            TextFormField(
              readOnly: true,
              focusNode: inputAddressNode,
              onTap: _onTapChooseCurrentAddress,
              controller: inputAddress,
              keyboardType: TextInputType.text,
              style: textStyle(TnexTypography.body14Med),
              textAlignVertical: TextAlignVertical.bottom,
              decoration: new InputDecoration(
                  hintText: "Nhập địa chỉ",
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 5),
                  border: InputBorder.none,
                  hintStyle: textStyle(TnexTypography.body14Med)),
              maxLines: null,
            )
          ]),
          Positioned(
              top: 8,
              right: 3,
              child: Container(width: 0, height: 0,)
          )
        ],));
  }

  _onTapChooseCurrentAddress() {

  }
}