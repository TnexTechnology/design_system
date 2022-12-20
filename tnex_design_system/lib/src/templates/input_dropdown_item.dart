import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../fonts.dart';
import '/src/colors.dart';

enum DropdownState {
  select,
  normal,
  disable,
}

class InputDropdownItemWithTitle extends StatefulWidget {

  final String? label;
  final String placeHolder;
  final VoidCallback? onTap;
  DropdownState state;
  final Widget? thumb;

  InputDropdownItemWithTitle({
    Key? key,
    this.label,
    this.state = DropdownState.normal,
    this.thumb,
    required this.placeHolder,
    this.onTap,
  }): super(key: key);

  @override
  State<InputDropdownItemWithTitle> createState() => _InputDropdownItemWithTitleState();

}

class _InputDropdownItemWithTitleState extends State<InputDropdownItemWithTitle> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: TnexColor.gray900,
          border:  Border.all(
            color: widget.state == DropdownState.select ? TnexColor.primary : TnexColor.gray900,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: () {
          if (widget.state != DropdownState.disable) {
            setState(() {
              widget.state = DropdownState.select;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          }

        },
        child: Opacity(
          opacity: widget.state == DropdownState.disable ? 0.3 : 1.0,
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (widget.label?.isEmpty ?? true) ? SizedBox()
                      : Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.label!,
                        style: textStyle(TnexTypography.caption12Med, color: TnexColor.gray500),
                        maxLines: 1,
                      )),
                  Row(
                    children: [
                      widget.thumb != null ? Container(
                        padding: EdgeInsets.only(right: 8),
                        child: widget.thumb!,
                      ) : SizedBox(),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.placeHolder,
                            style: textStyle(TnexTypography.body14Med),
                            maxLines: 1,
                          )),
                    ],
                  )
                ],
              )),
              _getArrowIcon()
            ]),
        ),
        ),
      ),
    );
  }

  Widget _getArrowIcon() {
      switch (widget.state) {
        case DropdownState.select:
          return Icon(
            Icons.keyboard_arrow_up,
            color: TnexColor.white,
          );
        case DropdownState.normal:
          return Icon(
            Icons.keyboard_arrow_down,
            color: TnexColor.gray500,
          );
        case DropdownState.disable:
          return Icon(
            Icons.keyboard_arrow_down,
            color: TnexColor.gray500,
          );
      }
  }
}