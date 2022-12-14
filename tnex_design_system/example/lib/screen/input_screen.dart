import 'package:flutter/material.dart';
import '/model/color_model.dart';
import '/model/typography_model.dart';
import '/main.dart';
import '/screen/item_list.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/templates/input_dropdown_item.dart';
import 'package:tnex_design_system/src/templates/text_input.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/templates/search_widget.dart';
import 'color_drop_down.dart';
import 'package:get/get.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key});

  @override
  State<InputScreen> createState() => _InputState();
}

class _InputState extends State<InputScreen> {
  List<TypographyModel>? itemList;
  Color color = TnexColor.primary;

  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
      backgroundColor: TnexColor.background,
      appBar: TnexAppBar(
        title: 'Input text + Search',
        onClickBack: Get.back,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
          child: Column(
              children:[
                SizedBox(height: 30,),
                TnexTextFormField(
                  label: "Label",
                  placeHolder: "Enter something here",
                  validator: (text) {
                    if ((text?.length ?? 0) > 3) {
                      return null;
                    }
                    return "This is an error message";
                  },
                  succeeder: (text) {
                    if ((text?.length ?? 0) > 3) {
                      return "This is a success message.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TnexTextFormField(label: "Label", placeHolder: "Enter something here",
                  validator: (text) {
                    if ((text?.length ?? 0) > 3) {
                      return null;
                    }
                    return "This is an error message";
                  }, succeeder: (text) {
                    if ((text?.length ?? 0) > 3) {
                      return "This is a success message.";
                    }
                    return null;
                  },
                  icon: Image.asset("assets/images/system/ic_card.png",
                    height: 24, width: 24, color: TnexColor.gray700,),
                  errorIcon: Image.asset("assets/images/system/ic_info.png",
                    height: 24, width: 24, color: TnexColor.red900,),
                  validatedIcon: Image.asset("assets/images/system/ic_check_done_circle.png",
                    height: 24, width: 24, color: TnexColor.green900,),),
                SizedBox(height: 10,),
                TnexButton(title: "Dismiss keyboard", onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },),
                // SizedBox(height: 10,),
                // InputDropdownItemWithTitle(label: "City", placeHolder: "H?? N???i", state: DropdownState.disable),

                SizedBox(height: 10,),
                SearchFormField(
                  leftIcon: Image.asset("assets/images/system/ic_search.png",
                    height: 24, width: 24, color: TnexColor.white,),
                  rightIcon: Image.asset("assets/images/system/ic_close.png",
                    height: 24, width: 24, color: TnexColor.white,),
                  placeHolder: "Search...",
                  controller: TextEditingController(),
                ),
                SizedBox(height: 10,),
                SearchFormField(
                  leftIcon: Image.asset("assets/images/system/ic_search.png",
                    height: 24, width: 24, color: TnexColor.white,),
                  rightIcon: Image.asset("assets/images/system/ic_close.png",
                    height: 24, width: 24, color: TnexColor.white,),
                  placeHolder: "Keyword...",
                  controller: TextEditingController(),
                  borderColor: TnexColor.gray700,
                  backgroundColor: Colors.transparent,
                ),
              ]

          ),
        ),
      ),
    );
  }

  String validateNameFunc(String name) {
    return '* Vui l??ng ki???m tra l???i';
    return "";
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
                  hintText: "Nh???p ?????a ch???",
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