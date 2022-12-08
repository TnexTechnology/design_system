
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '/model/home_item_model.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:tnex_design_system/src/templates/button.dart';
import 'package:tnex_design_system/src/fonts.dart';

class TopbarListScreen extends StatefulWidget {
  final String? title;
  const TopbarListScreen({Key? key, this.title});

  @override
  State<TopbarListScreen> createState() => _TopbarListState();
}

class _TopbarListState extends State<TopbarListScreen> {
  List<HomeItemModel>? itemList;

  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
      appBar: TnexAppBar(
        title: widget.title ?? "",
        isShowBack: true,
      ),
      body: Container(
        child: Column(
            children:[
              SizedBox(height: 20),
              Expanded(
                  child: _gridView()),
            ]
        ),
      ),
    );
  }

  Widget _gridView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            height: 50,
            color: TnexColor.white,
            child: Center(child: Text(itemList![index].name),),
          ),
          onTap: () {
            onTapItem(itemList![index]);
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
    ];
  }

  void onTapItem(HomeItemModel item) {
    switch (item.id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopbarRoute(title: item.name,),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopbarRoute(
              title: item.name,
              rightItems: [TopbarButton(
                onPressed: () {
                  print("clickkkk");
                }, image: Image.asset("assets/images/top_bar.png",
                  width: 16, height: 16),
              )],
            ),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopbarRoute(
              rightItems: [TopbarButton(
                onPressed: () {
                  print("click share");
                }, image: Image.asset("assets/images/system/ic_share.png",
                  width: 16, height: 16),
              ),
                TopbarButton(
                onPressed: () {
                  print("clickkkk");
                }, image: Image.asset("assets/images/top_bar.png",
                  width: 16, height: 16),
              ),
              ],
            ),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopbarRoute(
              isShowBack: false,
              rightItems: [TopbarButton(
                onPressed: Get.back, image: Image.asset("assets/images/system/ic_close.png",
                  width: 16, height: 16),
              )
              ],
            ),
          ),
        );
        break;
      default:
        break;
    }
  }
}

class TopbarRoute extends StatelessWidget {
  final List<Widget>? rightItems;
  final String? title;
  final bool isShowBack;

  const TopbarRoute({Key? key, this.title, this.isShowBack = false, this.rightItems});

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
              title: "Button CTA",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10,),
            TnexButton(
              title: "Button CTA",
              icon: Image.asset("assets/images/system/ic_call.png",
                  height: 20, width: 20),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TnexButtonStyle.rightToLeft,
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.red,
                child: const Text('Text Go back!', style: TextStyle(color: Colors.blue),),
              ),
            )
          ],
        ),
      ),
    );
  }
}