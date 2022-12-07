import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../fonts.dart';
import 'button.dart';


class TnexAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;
  final VoidCallback? onClickBack;
  final Widget? customBackButton;
  final bool isShowBack;
  final List<Widget>? rightItems;
  final double trailingPadding;
  final Color? backgroundColor;

  TnexAppBar({Key? key, this.title = "", this.onClickBack, this.rightItems, this.trailingPadding = 16, this.backgroundColor, this.isShowBack = true, this.customBackButton}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
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
      for (var element in widget.rightItems!) {
        rightItems.add(element);
        rightItems.add(SizedBox(
          width: widget.trailingPadding,
        ));
      }
    }
    return AppBar(
      centerTitle: true,
      primary: true,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: widget.backgroundColor ?? TnexColor.background,
      leading: widget.isShowBack ? widget.customBackButton ?? TnexBackButton(
        onPressed: widget.onClickBack,
      ) : SizedBox.shrink(),
      title: Text(widget.title,
          style: textStyle(TnexTypography.body18Semi),
          textAlign: TextAlign.left),
      actions: rightItems,
    );
  }
}

// class SearchNavigationBar extends StatefulWidget implements PreferredSizeWidget {
//
//   final String hintText;
//   final String labelText;
//   final VoidCallback? onClickBack;
//   final Widget? customBackButton;
//   final bool isShowBack;
//   final double trailingPadding;
//   final Color? backgroundColor;
//   final TextEditingController? searchController;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmitted;
//
//   SearchNavigationBar({
//     Key? key,
//     this.hintText = 'Tìm kiếm trên TNEX',
//     this.labelText = 'Tìm kiếm:',
//     this.onClickBack,
//     this.trailingPadding = 16,
//     this.backgroundColor,
//     this.isShowBack = true,
//     this.customBackButton,
//     this.searchController,
//     this.onChanged,
//     this.onSubmitted
//   }):
//         preferredSize = Size.fromHeight(kToolbarHeight),
//         super(key: key);
//   @override
//   final Size preferredSize; // default is 56.0
//   @override
//   _SearchNavigationBarState createState() => _SearchNavigationBarState();
// }
// class _SearchNavigationBarState extends State<SearchNavigationBar>{
//   bool isSearching = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         centerTitle: false,
//         primary: true,
//         elevation: 0,
//         titleSpacing: 0,
//         // backgroundColor: widget.backgroundColor ?? Colors.transparent,
//         backgroundColor: Colors.red,
//         leading: widget.isShowBack ? widget.customBackButton ?? TnexBackButton(
//           onPressed: widget.onClickBack,
//         ) : SizedBox.shrink(),
//         title: Container(
//           height: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               color: TnexColor.background,
//               border: Border.all(
//                   color: Util.isEmpty(widget.searchController.text) ? Colors.transparent : TnexColor.borderWidget, width: 1.5)
//           ),
//           child: _buildTextField(),
//         ),
//         actions: [SizedBox(
//           width: widget.trailingPadding,
//         )]
//     );
//   }
//
//   TextField _buildTextField() {
//     final _searchController = widget.searchController;
//     final isTextEmpty = Util.isEmpty(_searchController.text);
//     final primaryText14 = TextStyle(
//         fontSize: 14,
//         color: TnexColor.title,
//         fontWeight: FontWeight.w400,
//         decoration: TextDecoration.none);
//     final contentPadding = isTextEmpty ? EdgeInsets.symmetric(vertical: 15.w) : EdgeInsets.only(top: 15.w, bottom: 9.w);
//     final autofocus = isTextEmpty;
//     return TextField(
//       controller: _searchController,
//       style: primaryText14,
//       autofocus: autofocus,
//       decoration: InputDecoration(
//         isDense: true,
//         labelText: isTextEmpty ? null : widget.labelText,
//         labelStyle: isTextEmpty ? null : TextStyle(
//             fontSize: 12,
//             color: TnexColor.titlePlaceholder,
//             fontWeight: FontWeight.w400,
//             decoration: TextDecoration.none),
//         contentPadding: contentPadding,
//         border: InputBorder.none,
//         hintText: widget.hintText,
//         hintStyle: textStyle(TnexTypography.hintInput),
//         prefixIcon: Container(
//           padding: EdgeInsets.all(15),
//           child: Image.asset("assets/msb/icons/search_icon.png", width: 54.w, height: 54.w),
//         ),
//         suffixIcon: isTextEmpty ? null : IconButton(
//             icon: Image.asset("assets/msb/icons/close_icon.png", width: 36.w, height: 36.w),
//             onPressed: () => setState(() => _searchController.text = '')
//         ),
//
//       ),
//       onChanged: widget.onChanged ?? (text) {
//         if (Util.isEmpty(text)) {
//           print("hide clear text");
//           setState(() => {
//             isSearching = false
//           });
//         } else {
//           if (isSearching == false) {
//             print("show clear text");
//             setState(() => {
//               isSearching = true
//             });
//           }
//         }
//       },
//       // onChanged: widget.onChanged,
//       onSubmitted: widget.onSubmitted,
//       textAlignVertical: TextAlignVertical.center,
//       textInputAction: TextInputAction.search,
//     );
//
//   }
// }