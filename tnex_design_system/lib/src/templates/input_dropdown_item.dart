import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../fonts.dart';
import '/src/colors.dart';

enum DropdownState {
  select,
  normal,
  disable,
}

class InputDropdownItemWithTitle extends StatelessWidget {

  final String? label;
  final String placeHolder;
  final VoidCallback? onTap;
  final DropdownState state;
  final Widget? thumb;

  const InputDropdownItemWithTitle({
    Key? key,
    this.label,
    this.state = DropdownState.normal,
    this.thumb,
    required this.placeHolder,
    this.onTap,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: TnexColor.gray900,
          border: state == DropdownState.select ? Border.all(
            color: TnexColor.primary,
          ) : null,
          borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: state == DropdownState.disable ? 0.3 : 1.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (label?.isEmpty ?? true) ? SizedBox()
                        : Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          label!,
                          style: textStyle(TnexTypography.caption12Med, color: TnexColor.gray500),
                          maxLines: 1,
                        )),
                    Row(
                      children: [
                        thumb != null ? Container(
                          padding: EdgeInsets.only(right: 8),
                          child: thumb!,
                        ) : SizedBox(),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              placeHolder,
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
    );
  }

  Widget _getArrowIcon() {
      switch (state) {
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