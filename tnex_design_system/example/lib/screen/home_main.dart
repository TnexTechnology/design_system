
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tnex_design_system_example/screen/dropdown_screen.dart';
import 'package:tnex_design_system_example/screen/input_screen.dart';
import 'package:tnex_design_system_example/screen/switch_screen.dart';
import 'package:tnex_design_system_example/screen/tabbar_screen.dart';
import 'package:tnex_design_system_example/screen/toast_screen.dart';
import 'package:tnex_design_system_example/screen/tooltip/tooltip_screen.dart';
import 'package:tnex_design_system_example/screen/topbar/topbar_list.dart';
import '/model/home_item_model.dart';
import '/model/typography_model.dart';
import '/main.dart';
import '/screen/item_list.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'bottom_sheet_screen.dart';
import 'color_drop_down.dart';
import '/screen/home_screen.dart';
import 'package:tnex_design_system/src/templates/app_bar.dart';
import 'package:get/get.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  List<HomeItemModel>? itemList;

  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
      appBar: TnexAppBar(
        title: 'Template',
        isShowBack: false,
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
      HomeItemModel(name: 'Color + Typography', id: 1),
      HomeItemModel(name: 'Top bar', id: 2),
      HomeItemModel(name: 'Button', id: 4),
      HomeItemModel(name: 'Dropdown', id: 5),
      HomeItemModel(name: 'Input text + Search', id: 6),
      HomeItemModel(name: 'Bottom Sheet', id: 7),
      HomeItemModel(name: 'Toast', id: 8),
      HomeItemModel(name: 'Tool tip', id: 9),
      HomeItemModel(name: 'Toggle + Slider', id: 10),
    ];
  }

  void onTapItem(HomeItemModel item) {
    switch (item.id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopbarListScreen(title: item.name,),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToastDemoRoute(),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DropdownScreen(),
          ),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InputScreen(),
          ),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialWithModalsPageRoute(
            builder: (context) => BottomSheetDemoRoute(),
          ),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToastDemoRoute(),
          ),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TooltipScreen(),
          ),
        );
        break;
      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SwitchDemoRoute(),
          ),
        );
        break;
      default:
        break;
    }
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}