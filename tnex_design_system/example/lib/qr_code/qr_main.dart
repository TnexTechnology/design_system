import 'dart:convert';
import 'dart:typed_data';

import 'qr_pay.dart';
import 'bank_model.dart';
import 'package:crclib/crclib.dart';
import 'package:crclib/catalog.dart';
import 'package:crc/crc.dart';
import 'dart:convert';
import 'package:crclib/crclib.dart';
import 'package:crclib/catalog.dart';
import 'package:intl/intl.dart';

class QRPay {
  bool isValid = true;
  String version = "";
  String initMethod;
  Prodiver provider;
  Merchant? merchant;
  Consumer consumer;
  String? category;
  String? currency;
  String? amount;
  String? tipAndFeeType;
  String? tipAndFeeAmount;
  String? tipAndFeePercent;
  String? nation;
  String? acquier;
  String? city;
  String? zipCode;
  AdditionalData additionalData;
  String? crc;

  QRPay({
    this.version = '01',
    this.initMethod = '12',
    this.category,
    this.currency = "704",
    this.amount = "",
    this.tipAndFeeType = "",
    this.tipAndFeeAmount = "",
    this.tipAndFeePercent = "",
    this.nation = "",
    this.acquier = "",
    this.city = "",
    this.zipCode = "",
    this.crc, required Prodiver provider, required AdditionalData additionalData, required Consumer consumer, required Merchant merchant
  }) :
        this.provider = provider ?? Prodiver(),
        this.additionalData = additionalData ?? AdditionalData(),
        this.consumer = consumer ?? Consumer(),
        this.merchant = merchant ?? Merchant();

  void parse (String content) {
  if (content.length < 4) return this.invalid();
  // verify CRC
  final crcValid = verifyCRC(content);
  if (!crcValid) return this.invalid();
  this.parseRootContent(content);
  print("Start print data");
  print(this.version);
  print(this.provider.name);
  print(this.provider.guid);
  print(this.provider.service);
  print(this.provider.fieldId);
  print(this.initMethod);
  print(this.amount);
  print(this.consumer.bankBin);
  print(this.consumer.bankNumber);
  print(this.consumer.bankNumber);
  print(this.amount);
  print(this.additionalData.billNumber);
  print(this.additionalData.customerLabel);
  print(this.additionalData.reference);
  print(this.additionalData.purpose);
  print(this.additionalData.loyaltyNumber);
  print(this.additionalData.mobileNumber);
  print(this.additionalData.store);
  print(this.additionalData.terminal);
  print(this.category);
  print(this.currency);
  print(this.acquier);
  print(this.nation);
  print(this.tipAndFeeType);
  print(this.tipAndFeeAmount);
  }

 invalid () {
  this.isValid = false;
  }

  bool verifyCRC (String content) {
    final checkContent = content.substring(0, content.length - 4);
    final crcCode = content.substring(content.length - 4, content.length).toUpperCase();
    final genCrcCode = genCRCCode(checkContent);
    return crcCode == genCrcCode;
  }

  String buildOK () {
    final version = this.genFieldData(FieldID.VERSION, this.version);
    print("version: $version");
    final initMethod = this.genFieldData(FieldID.INIT_METHOD, this.initMethod);
    print("initMethod: $initMethod");
    final guid = this.genFieldData(ProviderFieldID.GUID, this.provider.guid);
    print("guid: $guid");
    String providerDataContent = '';
    if (this.provider.guid == QRProviderGUID.VIETQR) {
      final bankBin = this.genFieldData(VietQRConsumerFieldID.BANK_BIN, this.consumer.bankBin);
      final bankNumber = this.genFieldData(VietQRConsumerFieldID.BANK_NUMBER, this.consumer.bankNumber);
      providerDataContent = bankBin + bankNumber;
      print("@@@@111$providerDataContent");
    } else if (this.provider.guid == QRProviderGUID.VNPAY) {
      providerDataContent = this.merchant?.merchantId ?? '';
      print("@@@@$providerDataContent");
    }
    final provider = this.genFieldData(ProviderFieldID.DATA, providerDataContent);
    final service = this.genFieldData(ProviderFieldID.SERVICE, this.provider.service);
    final providerData = this.genFieldData(this.provider.fieldId, guid + provider + service);
    final category = this.genFieldData(FieldID.CATEGORY, this.category);
    final currency = this.genFieldData(FieldID.CURRENCY, this.currency);
    final amountStr = this.genFieldData(FieldID.AMOUNT, this.amount);
    final tipAndFeeType = this.genFieldData(FieldID.TIP_AND_FEE_TYPE, this.tipAndFeeType);
    final tipAndFeeAmount = this.genFieldData(FieldID.TIP_AND_FEE_AMOUNT, this.tipAndFeeAmount);
    final tipAndFeePercent = this.genFieldData(FieldID.TIP_AND_FEE_PERCENT, this.tipAndFeePercent);
    final nation = this.genFieldData(FieldID.NATION, this.nation);
    final acquier = this.genFieldData(FieldID.ACQUIER, this.acquier);
    final city = this.genFieldData(FieldID.CITY, this.city);
    final zipCode = this.genFieldData(FieldID.ZIP_CODE, this.zipCode);
    final buildNumber = this.genFieldData(AdditionalDataID.BILL_NUMBER, this.additionalData.billNumber);
    final mobileNumber = this.genFieldData(AdditionalDataID.MOBILE_NUMBER, this.additionalData.mobileNumber);
    final storeLabel = this.genFieldData(AdditionalDataID.STORE_LABEL, this.additionalData.store);
    final loyaltyNumber = this.genFieldData(AdditionalDataID.LOYALTY_NUMBER, this.additionalData.loyaltyNumber);
    final reference = this.genFieldData(AdditionalDataID.REFERENCE_LABEL, this.additionalData.reference);
    final customerLabel = this.genFieldData(AdditionalDataID.CUSTOMER_LABEL, this.additionalData.customerLabel);
    final terminal = this.genFieldData(AdditionalDataID.TERMINAL_LABEL, this.additionalData.terminal);
    final purpose = this.genFieldData(AdditionalDataID.PURPOSE_OF_TRANSACTION, this.additionalData.purpose);
    final dataRequest = this.genFieldData(AdditionalDataID.ADDITIONAL_CONSUMER_DATA_REQUEST, this.additionalData.dataRequest);
    final additionalDataContent = buildNumber + mobileNumber + storeLabel + loyaltyNumber + reference + customerLabel + terminal + purpose + dataRequest;
    final additionalData = this.genFieldData(FieldID.ADDITIONAL_DATA, additionalDataContent);
    final content = '${version}${initMethod}${providerData}${category}${currency}${amountStr}${tipAndFeeType}${tipAndFeeAmount}${tipAndFeePercent}${nation}${acquier}${city}${zipCode}${additionalData}${FieldID.CRC}04';
    print(content == "00020101021238530010A0000007270123000697041601092576788590208QRIBFTTA5303704540410005802VN62150811Chuyen tien6304");
    final crc = this.genCRCCode(content);
    print("crc: $crc");
    final code = content + crc;
    print(code == "00020101021238530010A0000007270123000697041601092576788590208QRIBFTTA5303704540410005802VN62150811Chuyen tien6304BBB8");
    print(code);
    return code;
//Check 3853???
  }

  String genFieldData (String? id, String? value) {
    print("value: $value");
  final fieldId = id ?? '';
  final fieldValue = value ?? '';
  final idLen = fieldId.length;
  if (idLen != 2 || fieldValue.length <= 0) return '';
    final format = NumberFormat('00');
    final str = format.format(fieldValue.length);
    final length = str.substring(str.length - 2, str.length);
  return '${fieldId}${length}${fieldValue}';
}

  String genCRCCode (String content) {
    final String crcCode = Crc16CcittFalse().convert(utf8.encode(content)).toRadixString(16).toUpperCase();
    return crcCode;
  }

  parseRootContent (String content) {
  final contentModel = this.sliceContent(content);
  final value = contentModel.value;
  print("value: $value");
  if (contentModel.value.length != contentModel.length) return this.invalid();
  switch (contentModel.id) {
    case FieldID.VERSION:
    this.version = value;
    break;
    case FieldID.INIT_METHOD:
      this.initMethod = value;
      break;
      case FieldID.VIETQR:
        this.provider.fieldId = contentModel.id;
        this.parseProviderInfo(value);
        break;
    case FieldID.VNPAYQR:
      this.provider.fieldId = contentModel.id;
      this.parseProviderInfo(value);
      break;
    case FieldID.CATEGORY:
      this.category = value;
      break;
    case FieldID.CURRENCY:
      this.currency = value;
      break;
    case FieldID.AMOUNT:
      this.amount = value;
      break;
    case FieldID.TIP_AND_FEE_TYPE:
      this.tipAndFeeType = value;
      break;
    case FieldID.TIP_AND_FEE_AMOUNT:
      this.tipAndFeeAmount = value;
      break;
    case FieldID.TIP_AND_FEE_PERCENT:
      this.tipAndFeePercent = value;
      break;
    case FieldID.NATION:
      this.nation = value;
      break;
    case FieldID.ACQUIER:
      this.acquier = value;
      break;
    case FieldID.CITY:
      this.city = value;
      break;
    case FieldID.ZIP_CODE:
      this.zipCode = value;
      break;
    case FieldID.ADDITIONAL_DATA:
      this.parseAdditionalData(value);
      break;
    case FieldID.CRC:
      this.crc = value;
      break;
    default:
      break;
}
if (contentModel.nextValue.length > 4) this.parseRootContent(contentModel.nextValue);
}
  ContentModel sliceContent (String content) {
    final id = content.substring(0, 2);
    final int length = int.parse(content.substring(2, 4));
    final value = content.substring(4, 4 + length);
    final nextValue = content.substring(4 + length);
    return ContentModel(id: id, length: length, value: value, nextValue: nextValue);
  }

  parseAdditionalData (String content) {
  final contentModel = this.sliceContent(content);
  final value = contentModel.value;
  switch (contentModel.id) {
    case AdditionalDataID.PURPOSE_OF_TRANSACTION:
    this.additionalData.purpose = value;
    break;
  case AdditionalDataID.BILL_NUMBER:
    this.additionalData.billNumber = value;
    break;
  case AdditionalDataID.MOBILE_NUMBER:
    this.additionalData.mobileNumber = value;
    break;
  case AdditionalDataID.REFERENCE_LABEL:
    this.additionalData.reference = value;
    break;
  case AdditionalDataID.STORE_LABEL:
    this.additionalData.store = value;
    break;
    case AdditionalDataID.TERMINAL_LABEL:
      this.additionalData.terminal = value;
    break;
    default:
    break;
    }
  if (contentModel.nextValue.length > 4) this.parseAdditionalData(contentModel.nextValue);
  }

  parseProviderInfo (String content) {
  final contentModel = this.sliceContent(content);
  final value = contentModel.value;
switch (contentModel.id) {
  case ProviderFieldID.GUID:
    this.provider.guid = value;
    break;
  case ProviderFieldID.DATA:
    if (this.provider.guid == QRProviderGUID.VNPAY) {
    this.provider.name = QRProvider.VNPAY;
    this.merchant?.merchantId = value;
    } else if (this.provider.guid == QRProviderGUID.VIETQR) {
      this.provider.name = QRProvider.VIETQR;
      this.parseVietQRConsumer(value);
    }
    break;
  case ProviderFieldID.SERVICE:
    this.provider.service = value;
    break;
  default:
    break;
  }
  if (contentModel.nextValue.length > 4) this.parseProviderInfo(contentModel.nextValue);
  }

  parseVietQRConsumer (String content) {
  final contentModel = this.sliceContent(content);
  final value = contentModel.value;
  switch (contentModel.id) {
  case VietQRConsumerFieldID.BANK_BIN:
    this.consumer.bankBin = value;
    print("day la bank bin: $value");
    break;
  case VietQRConsumerFieldID.BANK_NUMBER:
    this.consumer.bankNumber = value;
    break;
  default:
    break;
  }
  if (contentModel.nextValue.length > 4) this.parseVietQRConsumer(contentModel.nextValue);
  }

}

class ContentModel {
  final String id;
  int length;
  String value;
  String nextValue;
  ContentModel ({required this.id, required this.length, required this.value, required this.nextValue});
}