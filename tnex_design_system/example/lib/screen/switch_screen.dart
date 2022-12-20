import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/templates/switcher.dart';
import 'package:tnex_design_system/src/templates/tnex_slider.dart';
import 'package:tnex_design_system/src/templates/tnex_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:tnex_design_system_example/model/home_item_model.dart';
import 'package:get/get.dart';

class SwitchDemoRoute extends StatefulWidget {
  final List<Widget>? rightItems;
  final String? title;
  final bool isShowBack;


  SwitchDemoRoute({Key? key, this.title, this.isShowBack = true, this.rightItems});
  @override
  State<SwitchDemoRoute> createState() => _SwitchDemoState();

}

class _SwitchDemoState extends State<SwitchDemoRoute> {

  bool stateSwitch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TnexAppBar(
        title: widget.title,
        rightItems: widget.rightItems,
        isShowBack: widget.isShowBack,
      ),
      backgroundColor: TnexColor.background,
      body: Center(
        child: Column(
          children: [
            TnexButton(
              title: "Show Bottom Sheet",
              backgroundColor: stateSwitch ? TnexColor.primary : TnexColor.red900,
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomSwitcher(
              initValue: stateSwitch,
              onToggleChanged: _handleTog,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 26,
              child: TnexSlider(
                activeTrackColor: TnexColor.primary,
                inactiveTrackColor: TnexColor.gray500,
                thumbColor: TnexColor.primary,
                value: _value,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  double _value = 0.8;

  Future<bool> _handleTog(bool value) async {
    print("Value: ");
    setState(() {
      stateSwitch = value;
    });
    return stateSwitch;
  }
}
