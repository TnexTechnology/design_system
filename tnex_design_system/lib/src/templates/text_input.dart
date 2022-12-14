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
  final FormFieldValidator<String>? succeeder;
  final Widget? icon;
  final Widget? errorIcon;
  final Widget? validatedIcon;

  const TnexTextFormField({Key? key,
    this.placeHolder = "",
    this.label,
    this.backgroundColor,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.onEditingComplete,
    this.disableSystemKeyBoard = false,
    this.icon,
    this.errorIcon,
    this.validatedIcon,
    this.succeeder
  }) : super(key: key);
  @override
  State createState() => _TnexTextState();

}
class _TnexTextState extends State<TnexTextFormField>{
  TextInputType textInputType = TextInputType.text;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () => focusNode.requestFocus(),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: TnexColor.gray900,
                      borderRadius: BorderRadius.circular(8),
                      border: _getBorderBox()),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: widget.label != null
                                    ? Text(widget.label!, style: textStyle(TnexTypography.caption12Med, color: TnexColor.gray500))
                                    : Container()),
                            TextFormField(
                                onTap: widget.onTap,
                                onEditingComplete: widget.onEditingComplete,
                                autovalidateMode: AutovalidateMode.disabled,
                                // validator: (te) {
                                //   // return widget.validator!(te);
                                //   return checkFieldEmpty(te);
                                // },
                                onChanged: (text) {
                                  validateTextFormField(text);
                                  if (widget.onChanged != null) widget.onChanged!(text);
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
                                decoration: InputDecoration(
                                  // errorText: errorText,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 2),
                                  border: InputBorder.none,
                                  hintText: widget.placeHolder,
                                  hintStyle: textStyle(TnexTypography.body14Med, color: TnexColor.gray700),
                                )),
                          ])
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      _icon() == null ? SizedBox()
                          : _icon()!
                    ],
                  ),
                )),
            _getMessageWidget()
          ],
        ));
  }

  BoxBorder? _getBorderBox() {
    if (errorText?.isNotEmpty ?? false) {
      return Border.all(
        color: TnexColor.red900,
      );
    }
    if (focusNode.hasFocus == false) {
      return null;
    }
    if (succedText?.isNotEmpty ?? false) {
      return Border.all(
        color: TnexColor.green900,
      );
    }
    if (focusNode.hasFocus) {
      return Border.all(
        color: TnexColor.primary,
      );
    }
    return null;
  }

  Widget _getMessageWidget() {
    if (errorText?.isNotEmpty ?? false) {
      return Container(
        height: 18,
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          errorText!,
          textAlign: TextAlign.start,
          style: textStyle(TnexTypography.caption12Reg, color: TnexColor.red900),
        ),
      );
    }
    if (focusNode.hasFocus == false) {
      return const SizedBox();
    }
    if (succedText?.isNotEmpty ?? false) {
      return Container(
        height: 18,
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          succedText!,
          textAlign: TextAlign.start,
          style: textStyle(TnexTypography.caption12Reg, color: TnexColor.green900),
        ),
      );
    }
    return const SizedBox();
  }

  Widget? _icon() {
    if (errorText?.isNotEmpty ?? false) {
      return widget.errorIcon;
    }
    if (focusNode.hasFocus == false) {
      return widget.icon;
    }
    if (succedText?.isNotEmpty ?? false) {
      return widget.validatedIcon;
    }
    return widget.icon;
  }

  void validateTextFormField(String? fieldContent) {
    setState(() {
      succedText = widget.succeeder!(fieldContent);
      errorText = widget.validator!(fieldContent);
    });
  }
}