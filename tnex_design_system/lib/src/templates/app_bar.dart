import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/colors.dart';
import './button.dart';
import '/src/fonts.dart';

class TnexAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String? title;
  final Function? onClickBack;
  final bool isShowBack;
  final List<Widget>? rightItems;
  final double trailingPadding;
  final Color? backgroundColor;

  TnexAppBar({Key? key, this.title, this.onClickBack, this.rightItems, this.trailingPadding = 16, this.backgroundColor, this.isShowBack = true}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _BaseNavigationBarState createState() => _BaseNavigationBarState();
}
class _BaseNavigationBarState extends State<TnexAppBar>{
  @override
  Widget build(BuildContext context) {
    List<Widget> rightItems = [];
    if (widget.rightItems != null) {
      widget.rightItems?.forEach((element) {
        rightItems.add(element);
        rightItems.add(SizedBox(
          width: widget.trailingPadding,
        ));
      });
    }
    print(rightItems.length);
    return AppBar(
      centerTitle: true,
      primary: true,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: widget.backgroundColor ?? TnexColor.background,
      leading: widget.isShowBack ? MSBBackButton(
        onPressed: widget.onClickBack,
      ) : SizedBox.shrink(),
      title: (widget.title?.isNotEmpty ?? false) ? Text(widget.title!,
          style: textStyle(TnexTypography.body18Semi),
          textAlign: TextAlign.left) : null,
      actions: rightItems,
    );
  }
}