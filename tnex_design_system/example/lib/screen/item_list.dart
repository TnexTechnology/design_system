import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/typography_model.dart';
import '/screen/get_ratings.dart';
import '/screen/grid_item_details.dart';
import 'package:tnex_design_system/src/colors.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:tnex_design_system/src/colors.dart';
import 'package:tnex_design_system/src/fonts.dart';
import 'package:tnex_design_system_example/qr_code/qr_main.dart';
import 'package:tnex_design_system_example/qr_code/qr_pay.dart';

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
        // final qrCode = "00020101021138580010A000000727012800069704260114888980172946960208QRIBFTTA53037045802VN630494C1";
        final qrCodq = "00020101021238580010A000000727012800069704260114888980172946960208QRIBFTTA53037045802VN63047598";
        final qrCodd = '00020101021153037045802VN630483CC';
        final qrCode = "00020101021238580010A000000727012800069704260114031010165781180208QRIBFTTA5303704540105802VN63041508";
        // final qrCode = "00020101021238560010A0000007270126000697041501121133666688880208QRIBFTTA530370454067900005802VN62100806AX100163046DA4";
        final provider = Prodiver(fieldId: "38", name: QRProvider.VIETQR, guid: QRProviderGUID.VIETQR, service: 'QRIBFTTA');
        final merchant = Merchant(merchantId: "33");
        final consumer = Consumer(bankBin: "970426", bankNumber: '88898017294696');
        final additionalData = AdditionalData(dataRequest: null, billNumber: null, store: null, loyaltyNumber: null, reference: null, customerLabel: null, terminal: null, purpose: "", mobileNumber: '');
        final qrPay = QRPay(version: '01', initMethod: "12", provider: provider, merchant: merchant, consumer: consumer, category: "", currency: "704", amount: "", tipAndFeeType: "", tipAndFeeAmount: "", tipAndFeePercent: "", nation: "VN", acquier: "", city: "", zipCode: "", additionalData: additionalData, crc: "crc");
        qrPay.parse(qrCode);
        // qrPay.buildOK();
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