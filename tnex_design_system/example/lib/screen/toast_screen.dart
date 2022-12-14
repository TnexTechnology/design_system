import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/toast_utils.dart';

class ToastDemoRoute extends StatelessWidget {
  final List<Widget>? rightItems;
  final String? title;
  final bool isShowBack;

  const ToastDemoRoute({Key? key, this.title, this.isShowBack = true, this.rightItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TnexAppBar(
        title: title,
        rightItems: rightItems,
        isShowBack: isShowBack,
      ),
      backgroundColor: TnexColor.background,
      body: Center(
        child: Column(
          children: [
            TnexButton(
              title: "Show Toast Info",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                ToastUtils.showMessageToast(context, "Info notification", type: ToastType.info);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Show Toast Succeed",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                ToastUtils.showMessageToast(context, "Success notification", type: ToastType.succeed);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Show Toast Warning",
              onPressed: () {
                ToastUtils.showMessageToast(context, "Warning notification", type: ToastType.warning);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Show Toast Failed",
              onPressed: () {
                ToastUtils.showMessageToast(context, "Danger notification", type: ToastType.danger);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              height: 40,
              width: 40,
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              backgroundColor: TnexColor.primary800,
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              borderColor: TnexColor.gray700,
              textColor: TnexColor.primary,
              backgroundColor: Colors.transparent,
              icon: Image.asset("assets/images/system/ic_call.png",
                height: 20, width: 20, color: TnexColor.primary,),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              textColor: TnexColor.gray500,
              backgroundColor: TnexColor.gray800,
              icon: Image.asset("assets/images/system/ic_call.png",
                height: 20, width: 20, color: TnexColor.gray500,),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
            ),

            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              textColor: TnexColor.primary,
              backgroundColor: Colors.transparent,
              icon: Image.asset("assets/images/system/ic_call.png",
                height: 20, width: 20, color: TnexColor.primary ,),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(TnexColor.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                  )
              ),
              child: Container(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/system/ic_close.png",
                          height: 20, width: 20),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "FRIENDS",
                        style: textStyle(TnexTypography.body14Semi),
                      )
                    ]
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     color: Colors.red,
            //     child: const Text('Text Go back!', style: TextStyle(color: Colors.blue),),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}