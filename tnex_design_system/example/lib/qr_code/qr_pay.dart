

class VietQRSevice {
  VietQRSevice._();
  static const String BY_ACCOUNT_NUMBER = 'QRIBFTTA'; // Dịch vụ chuyển nhanh đến Tài khoản
  static const String BY_CARD_NUMBER = 'QRIBFTTC'; // Dịch vụ chuyển nhanh đến Thẻ
}

class QRProviderGUID {
  QRProviderGUID._();
  static const String VNPAY = 'A000000775';
  static const String VIETQR = 'A000000727';
}


class FieldID {
  FieldID._();
  static const String VERSION = '00';
  static const String INIT_METHOD = '01';
  static const String VNPAYQR = '26';
  static const String VIETQR = '38';
  static const String CATEGORY = '52';
  static const String CURRENCY = '53';
  static const String AMOUNT = '54';
  static const String TIP_AND_FEE_TYPE = '55';
  static const String TIP_AND_FEE_AMOUNT = '56';
  static const String TIP_AND_FEE_PERCENT = '57';
  static const String NATION = '58';
  static const String ACQUIER = '59';
  static const String CITY = '60';
  static const String ZIP_CODE = '61';
  static const String ADDITIONAL_DATA = '62';
  static const String CRC = '63';
}

class ProviderFieldID {
  ProviderFieldID._();
  static const String GUID = '00';
  static const String DATA = '01';
  static const String SERVICE = '02';
}

class QRProvider {
  QRProvider._();
  static const String VIETQR = 'VIETQR';
  static const String VNPAY = 'VNPAY';
}

class VietQRConsumerFieldID {
  VietQRConsumerFieldID._();
  static const String BANK_BIN = '00';
  static const String BANK_NUMBER = '01';
}

class AdditionalDataID {
  AdditionalDataID._();
  static const String BILL_NUMBER = '01'; // Số hóa đơn
  static const String MOBILE_NUMBER = '02'; // Số ĐT
  static const String STORE_LABEL = '03'; // Mã cửa hàng
  static const String LOYALTY_NUMBER = '04'; // Mã khách hàng thân thiết
  static const String REFERENCE_LABEL = '05'; // Mã tham chiếu
  static const String CUSTOMER_LABEL = '06'; // Mã khách hàng
  static const String TERMINAL_LABEL = '07'; // Mã số điểm bán
  static const String PURPOSE_OF_TRANSACTION = '08'; // Mục đích giao dịch
  static const String ADDITIONAL_CONSUMER_DATA_REQUEST = '09'; // Yêu cầu dữ liệu KH bổ sung
}

class Prodiver {

  String? fieldId;
  String? name;
  String? guid;
  String? service;
  Prodiver( {this.fieldId = "", this.service = "", this.name = "", this.guid = ""});
}

class AdditionalData {
  String? billNumber;
  String? mobileNumber;
  String? store;
  String? loyaltyNumber;
  String? reference;
  final String? customerLabel;
  String? terminal;
  String? purpose;
  final String? dataRequest;
  AdditionalData( {this.billNumber, this.mobileNumber, this.store, this.loyaltyNumber, this.reference, this.customerLabel, this.terminal, this.purpose, this.dataRequest});
}

class Consumer {
  String? bankBin;
  String? bankNumber;
  Consumer( {this.bankBin, this.bankNumber});
}


class Merchant {
  String? merchantId;
  Merchant( {this.merchantId});
}