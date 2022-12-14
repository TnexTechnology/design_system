import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/fonts.dart';

import '../colors.dart';

class SearchFormField extends StatefulWidget {

  final String placeHolder;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final EdgeInsetsGeometry? padding;

  const SearchFormField({Key? key,
    this.placeHolder = "",
    this.backgroundColor = TnexColor.gray900,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.leftIcon,
    this.rightIcon,
    this.borderColor = TnexColor.gray900,
    this.padding = const EdgeInsets.all(16)
  }) : super(key: key);
  @override
  State createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<SearchFormField>{
  TextInputType textInputType = TextInputType.text;
  bool _showClearButton = false;
  FocusNode focusNode = FocusNode();
  String? errorText;
  String? succedText;
  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: GestureDetector(
            onTap: () => focusNode.requestFocus(),
            behavior: HitTestBehavior.translucent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: _borderColor()),
              child: TextField(
                  onTap: widget.onTap,
                  onEditingComplete: widget.onEditingComplete,
                  onChanged: _handleTextChanged,
                  controller:  widget.controller,
                  keyboardType: textInputType,
                  style: textStyle(TnexTypography.body14Med),
                  textAlignVertical: TextAlignVertical.center,
                  focusNode: focusNode,
                  cursorColor: TnexColor.primary,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Container(
                      padding: widget.padding,
                      child: Image.asset("assets/ic_search.png", package: "tnex_design_system",
                        height: 24, width: 24, color: TnexColor.white,),
                    ),
                    suffixIcon: _showClearButton ? Container(
                      // padding: EdgeInsets.all(16),
                      child: IconButton(
                        icon: Image.asset("assets/ic_close.png", package: "tnex_design_system",
                          height: 24, width: 24, color: TnexColor.white,),
                        onPressed:() {
                          widget.controller?.clear();
                          setState(() {
                            _showClearButton = false;
                          });
                      },
                      ),
                    ) : null,
                    border: InputBorder.none,
                    hintText: widget.placeHolder,
                    hintStyle: textStyle(TnexTypography.body14Med, color: TnexColor.gray700),
                  )),
            )));
  }

  Border? _borderColor() {
    if (focusNode.hasFocus) {
      return Border.all(
          color: TnexColor.primary);
    }
    if (widget.borderColor != null) {
      return Border.all(
          color: widget.borderColor!);
    }
    return null;
  }

  _handleTextChanged(String text) {
    if (text.isEmpty) {
      if (_showClearButton == true) {
        setState(() {
          _showClearButton = false;
        });
      }

    } else {
      if (_showClearButton == false) {
        setState(() {
          _showClearButton = true;
        });
      }
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }
}