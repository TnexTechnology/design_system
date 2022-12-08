import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/fonts.dart';

import '../colors.dart';

class TnexTextFormField extends StatefulWidget {

  final String placeHolder;
  final String? label;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final bool disableSystemKeyBoard;
  final String? errorText;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TnexTextFormField({
    Key? key,
    this.placeHolder = "",
    this.label,
    this.backgroundColor,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.onEditingComplete,
    this.disableSystemKeyBoard = false,
    this.errorText
  });
  @override
  State createState() => _TnexTextState();

}
class _TnexTextState extends State<TnexTextFormField>{
  TextInputType textInputType = TextInputType.text;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: TnexColor.gray900,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: TnexColor.primary,
            )),
        child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
                child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      child: widget.label != null
                          ? Text(widget.label!, style: textStyle(TnexTypography.caption12Med, color: TnexColor.gray500))
                          : Container()),
                  TextFormField(
                      onTap: widget.onTap,
                      onEditingComplete: widget.onEditingComplete,
                      autovalidateMode: widget.autovalidateMode,
                      validator: widget.validator,
                      onChanged: (text) {
                        if (widget.onChanged != null) {
                          widget.onChanged!(text);
                        }
                      },
                      controller:  widget.controller,
                      keyboardType: textInputType,
                      style: textStyle(TnexTypography.body14Med),
                      textAlignVertical: TextAlignVertical.bottom,
                      focusNode: focusNode,
                      cursorColor: TnexColor.primary,
                      readOnly: widget.disableSystemKeyBoard,
                      showCursor: widget.disableSystemKeyBoard ? true : null,
                      enableInteractiveSelection: !widget.disableSystemKeyBoard,
                      decoration: new InputDecoration(
                        errorText: widget.errorText,
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 2),
                        border: InputBorder.none,
                        hintText: widget.placeHolder,
                        hintStyle: textStyle(TnexTypography.body14Med, color: TnexColor.gray700),
                      )),
                ]))));
  }

  // TextField _buildTextField() {
  //   final _searchController = widget.searchController;
  //   final isTextEmpty = Util.isEmpty(_searchController.text);
  //   final primaryText14 = TextStyle(
  //       fontSize: 14,
  //       color: TnexColor.title,
  //       fontWeight: FontWeight.w400,
  //       decoration: TextDecoration.none);
  //   final contentPadding = isTextEmpty ? EdgeInsets.symmetric(vertical: 15.w) : EdgeInsets.only(top: 15.w, bottom: 9.w);
  //   final autofocus = isTextEmpty;
  //   return TextField(
  //     controller: _searchController,
  //     style: primaryText14,
  //     autofocus: autofocus,
  //     decoration: InputDecoration(
  //       isDense: true,
  //       labelText: isTextEmpty ? null : widget.labelText,
  //       labelStyle: isTextEmpty ? null : TextStyle(
  //           fontSize: 12,
  //           color: TnexColor.titlePlaceholder,
  //           fontWeight: FontWeight.w400,
  //           decoration: TextDecoration.none),
  //       contentPadding: contentPadding,
  //       border: InputBorder.none,
  //       hintText: widget.hintText,
  //       hintStyle: textStyle(TnexTypography.hintInput),
  //       prefixIcon: Container(
  //         padding: EdgeInsets.all(15),
  //         child: Image.asset("assets/msb/icons/search_icon.png", width: 54.w, height: 54.w),
  //       ),
  //       suffixIcon: isTextEmpty ? null : IconButton(
  //           icon: Image.asset("assets/msb/icons/close_icon.png", width: 36.w, height: 36.w),
  //           onPressed: () => setState(() => _searchController.text = '')
  //       ),
  //
  //     ),
  //     onChanged: widget.onChanged ?? (text) {
  //       if (Util.isEmpty(text)) {
  //         print("hide clear text");
  //         setState(() => {
  //           isSearching = false
  //         });
  //       } else {
  //         if (isSearching == false) {
  //           print("show clear text");
  //           setState(() => {
  //             isSearching = true
  //           });
  //         }
  //       }
  //     },
  //     // onChanged: widget.onChanged,
  //     onSubmitted: widget.onSubmitted,
  //     textAlignVertical: TextAlignVertical.center,
  //     textInputAction: TextInputAction.search,
  //   );
  //
  // }
}