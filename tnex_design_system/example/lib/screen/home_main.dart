
import 'package:flutter/material.dart';
import '/model/home_item_model.dart';
import '/model/typography_model.dart';
import '/main.dart';
import '/screen/item_list.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
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
        onClickBack: () {
          print("333333");
        },
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
      HomeItemModel(name: 'Tab bar', id: 3),
      HomeItemModel(name: 'Button', id: 4),
      HomeItemModel(name: 'Tab', id: 5),
      HomeItemModel(name: 'Input', id: 6),
    ];
  }

  void onTapItem(HomeItemModel item) {
    switch (item.id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondRoute()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
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