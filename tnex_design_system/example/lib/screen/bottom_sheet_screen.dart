import 'package:flutter/material.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/templates/tnex_bottom_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:tnex_design_system_example/model/home_item_model.dart';

class BottomSheetDemoRoute extends StatelessWidget {
  final List<Widget>? rightItems;
  final String? title;
  final bool isShowBack;


  BottomSheetDemoRoute({Key? key, this.title, this.isShowBack = true, this.rightItems});

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
              title: "Show Bottom Sheet",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TnexButton(
              title: "Show Modal Bottom Sheet",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                _showModalBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) async {
    // await showModalBottomSheet(
    //     context: context,
    //     isScrollControlled: true,
    //     backgroundColor: Colors.transparent,
    //     builder: (c) {
    //       return GestureDetector(
    //           onTap: () => Navigator.of(context).pop(),
    //           child: Container(
    //             color: const Color.fromRGBO(0, 0, 0, 0.001),
    //             child: TnexBottomSheet(title: "Title", contentWidget: TermsAndConditionsWidget(),),
    //           )
    //       );
    //     }
    // );
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.001),
                child: TnexBottomSheet(title: "Title", contentWidget: TermsAndConditionsWidget(),),
              )
          ),
    );
  }

  _showModalBottomSheet(BuildContext context) async {
    await showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
      ModalInsideModal(),
    );
  }

}

class TermsAndConditionsWidget extends StatefulWidget {

  final Function(HomeItemModel)? onTap;
  TermsAndConditionsWidget({this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _TermsAndConditionsWidgetState();
  }
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {

  List<HomeItemModel> itemList = [];
  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Container(
      height: (5) * 50.0,
      padding: EdgeInsets.all(24),
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.2,
        maxChildSize: 1.0,
        builder: (_, controller) {
          return  _gridView();
        },
      ),
    );
  }

  Widget _gridView() {
    return ListView.separated(
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            height: 50,
            color: TnexColor.white,
            child: Center(child: Text(itemList![index].name),),
          ),
          onTap: () {
            widget.onTap!(itemList![index]);
          },
        );
      },
      separatorBuilder: (context, position) {
        return const SizedBox(height: 10,);
      },
      itemCount: itemList?.length ?? 0,
    );
  }

  List<HomeItemModel> _itemList() {
    return [
      HomeItemModel(name: 'Topbar 1', id: 1),
      HomeItemModel(name: 'Topbar 2', id: 2),
      HomeItemModel(name: 'Topbar 3', id: 3),
      HomeItemModel(name: 'Topbar 4', id: 4),
      HomeItemModel(name: 'Topbar 5', id: 4),
      HomeItemModel(name: 'Topbar 6', id: 4),

    ];
  }
}

class ModalInsideModal extends StatelessWidget {
  final ScrollController? scrollController;

  const ModalInsideModal({Key? key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TnexColor.background,
      body: SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                100,
                    (index) => ListTile(
                    title: Text('Dropdown item $index', style: textStyle(TnexTypography.body14Med),),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      isDismissible: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          ModalInsideModal(
                              scrollController: scrollController),
                    )),
              )).toList(),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          height: 60,
          child: CupertinoNavigationBar(
            padding: EdgeInsetsDirectional.zero,
            backgroundColor: TnexColor.gray800,
            middle: Semantics(
              label: "dashboard-main-page-title",
              child: Text(
                "Title",
                style: textStyle(TnexTypography.body18Semi)
              ),
            ),
            leading: TextButton(
                onPressed: () {
                  print("Cancel press");
                  Navigator.of(context).pop();
                },
                child: Text('Cancel', style: textStyle(TnexTypography.body16Semi, color: TnexColor.primary))
            ),
            trailing: TextButton(
                onPressed: () {
                  print("save press");
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(TnexColor.gray900)
                ),
                child: Text('Save', style: textStyle(TnexTypography.body16Semi, color: TnexColor.primary))
            ),
          ),
        ),
      ),
    );
  }
}