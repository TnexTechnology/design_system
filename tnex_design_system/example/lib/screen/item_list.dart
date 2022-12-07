import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/typography_model.dart';
import '/screen/get_ratings.dart';
import '/screen/grid_item_details.dart';
import 'package:tnex_design_system/src/colors.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';

class ItemList extends StatelessWidget {
  final TypographyModel item;

  const ItemList(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GridItemDetails(this.item),
        //   ),
        // );
      },
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: item.color),
                padding: EdgeInsets.all(4.0),
                // height: 60,

              ),
            ),

            new Padding(
              padding: EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
              child: Text(
                item.typoType.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle(item.typoType, color: item.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on TnexTypography {
  static final _names = {
    TnexTypography.heading1: "Heading 1",
    TnexTypography.heading2: "Heading 2",
    TnexTypography.heading3: "Heading 3",
    TnexTypography.heading4: "Heading 4",
    TnexTypography.heading5: "Heading 5",
    TnexTypography.heading6: "Heading 6",
    TnexTypography.body18Semi: "Body text 18 Semibold",
    TnexTypography.body18Med: "Body text 18 Medium",
    TnexTypography.body18Reg: "Body text 18 Regular",
    TnexTypography.body16Semi: "Body text 16 Semibold",
    TnexTypography.body16Med: "Body text 16 Medium",
    TnexTypography.body16Reg: "Body text 16 Regular",
    TnexTypography.body14Semi: "Body text 14 Semibold",
    TnexTypography.body14Med: "Body text 14 Medium",
    TnexTypography.body14Reg: "Body text 14 Regular",
    TnexTypography.body12Semi: "Body text 12 Semibold",
    TnexTypography.body12Med: "Body text 12 Medium",
    TnexTypography.body12Reg: "Body text 12 Regular"
  };

  String get name => _names[this] ?? "Body text";
}