import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/fonts.dart';
import '../colors.dart';

class TnexBottomSheet extends StatefulWidget {
  final String? title;
  final Widget contentWidget;

  const TnexBottomSheet(
      {Key? key,
        this.title,
        required this.contentWidget})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => TnexBottomSheetState();
}

class TnexBottomSheetState extends State<TnexBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(children: [
          Expanded(child: SizedBox()),
          Container(width: 41, height: 4,
              decoration: BoxDecoration(
                  color: TnexColor.gray600,
                  borderRadius:
                  BorderRadius.all(Radius.circular(2)))),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: TnexColor.background,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(22))),
            margin: EdgeInsets.only(top: 8),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      height: 60,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, null);
                        },
                        child: Container(
                          child: Center(child: Text(widget.title ?? "",
                              style: textStyle(TnexTypography.body18Semi))),
                        ),
                      )),
                  Container(height: 1, color: TnexColor.gray800,),
                  Container(
                    child: widget.contentWidget,
                  )

                ]),),

        ],)
      ),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true
    );
  }

}