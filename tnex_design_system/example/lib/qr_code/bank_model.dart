class BankModel {
  final String key;
  final String code;
  final String name;
  final String bin;
  final String shortName;
  final String swiftCode;

  BankModel( {required this.key, required this.code, required this.name, required this.bin, required this.shortName, required this.swiftCode});

}

List<BankModel> banks = [
  BankModel(key: BankKey.ABBANK,
      code: BankCode.ABBANK,
      name: 'Ngân hàng TMCP An Bình',
      bin: '970425',
      shortName: 'AB Bank',
      swiftCode: 'ABBKVNVX'),
  BankModel(key: BankKey.MSB,
      code: BankCode.MSB,
      name: 'Ngân hàng TMCP Hàng Hải',
      bin: '970426',
      shortName: 'MSB',
      swiftCode: 'MCOBVNVX')
];

class BankKey {
  BankKey._();
  static const String ABBANK = 'abbank';
  static const String ACB = 'acb';
  static const String AGRIBANK = 'agribank';
  static const String BAC_A_BANK = 'bacabank';
  static const String BAOVIET_BANK = 'baoviet';
  static const String BIDC = 'bidc';
  static const String BIDV = 'bidv';
  static const String CAKE = 'cake';
  static const String CBBANK = 'cbbank';
  static const String CIMB = 'cimb';
  static const String COOP_BANK = 'coopbank';
  static const String DBS_BANK = 'dbsbank';
  static const String DONG_A_BANK = 'dongabank';
  static const String EXIMBANK = 'eximbank';
  static const String GPBANK = 'gpbank';
  static const String HDBANK = 'hdbank';
  static const String HONGLEONG_BANK = 'hongleongbank';
  static const String HSBC = 'hsbc';
  static const String IBK_HCM = 'ibkhcm';
  static const String IBK_HN = 'ibkhn';
  static const String INDOVINA_BANK = 'indovinabank';
  static const String KASIKORN_BANK = 'kasikorn';
  static const String KIENLONG_BANK = 'kienlongbank';
  static const String KOOKMIN_BANK_HCM = 'kookminhcm';
  static const String KOOKMIN_BANK_HN = 'kookminhn';
  static const String LIENVIETPOST_BANK = 'lienvietpostbank';
  static const String MBBANK = 'mbbank';
  static const String MSB = 'msb';
  static const String NAM_A_BANK = 'namabank';
  static const String NCB = 'ncb';
  static const String NONGHYUP_BANK_HN = 'nonghyup';
  static const String OCB = 'ocb';
  static const String OCEANBANK = 'oceanbank';
  static const String PGBANK = 'pgbank';
  static const String PUBLIC_BANK = 'publicbank';
  static const String PVCOM_BANK = 'pvcombank';
  static const String SACOMBANK = 'sacombank';
  static const String SAIGONBANK = 'saigonbank';
  static const String SCB = 'scb';
  static const String SEA_BANK = 'seabank';
  static const String SHB = 'shb';
  static const String SHINHAN_BANK = 'shinhanbank';
  static const String STANDARD_CHARTERED_BANK = 'standardcharteredbank';
  static const String TECHCOMBANK = 'techcombank';
  static const String TPBANK = 'tpbank';
  static const String UBANK = 'ubank';
  static const String UNITED_OVERSEAS_BANK = 'uob';
  static const String VIB = 'vib';
  static const String VIET_A_BANK = 'vietabank';
  static const String VIET_BANK = 'vietbank';
  static const String VIETCAPITAL_BANK = 'banviet';
  static const String VIETCOMBANK = 'vietcombank';
  static const String VIETINBANK = 'vietinbank';
  static const String VPBANK = 'vpbank';
  static const String VRB = 'vrb';
  static const String WOORI_BANK = 'wooribank';
}

class BankCode {
  BankCode._();
  static const String ABBANK = 'ABB';
  static const String ACB = 'ACB';
  static const String AGRIBANK = 'AGRIBANK';
  static const String BAC_A_BANK = 'BAB';
  static const String BAOVIET_BANK = 'BAOVIETBANK';
  static const String BIDC = 'BIDC';
  static const String BIDV = 'BID';
  static const String CAKE = 'CAKE';
  static const String CBBANK = 'VNCB';
  static const String CIMB = 'CIMB';
  static const String COOP_BANK = 'COOPBANK';
  static const String DBS_BANK = 'DBS';
  static const String DONG_A_BANK = 'DONGABANK';
  static const String EXIMBANK = 'EIB';
  static const String GPBANK = 'GPBANK';
  static const String HDBANK = 'HDB';
  static const String HONGLEONG_BANK = 'HLB';
  static const String HSBC = 'HSBC';
  static const String IBK_HCM = 'IBKHCM';
  static const String IBK_HN = 'IBKHN';
  static const String INDOVINA_BANK = 'IVB';
  static const String KASIKORN_BANK = 'KBANK';
  static const String KIENLONG_BANK = 'KLB';
  static const String KOOKMIN_BANK_HCM = 'KBHCM';
  static const String KOOKMIN_BANK_HN = 'KBHN';
  static const String LIENVIETPOST_BANK = 'LPB';
  static const String MBBANK = 'MBB';
  static const String MSB = 'MSB';
  static const String NAM_A_BANK = 'NAB';
  static const String NCB = 'NVB';
  static const String NONGHYUP_BANK_HN = 'NONGHYUP';
  static const String OCB = 'OCB';
  static const String OCEANBANK = 'OCEANBANK';
  static const String PGBANK = 'PGB';
  static const String PUBLIC_BANK = 'PBVN';
  static const String PVCOM_BANK = 'PVCOMBANK';
  static const String SACOMBANK = 'STB';
  static const String SAIGONBANK = 'SGB';
  static const String SCB = 'SCB';
  static const String SEA_BANK = 'SSB';
  static const String SHB = 'SHB';
  static const String SHINHAN_BANK = 'SVB';
  static const String STANDARD_CHARTERED_BANK = 'SC';
  static const String TECHCOMBANK = 'TCB';
  static const String TPBANK = 'TPB';
  static const String UBANK = 'UBANK';
  static const String UNITED_OVERSEAS_BANK = 'UOB';
  static const String VIB = 'VIB';
  static const String VIET_A_BANK = 'VAB';
  static const String VIET_BANK = 'VBB';
  static const String VIETCAPITAL_BANK = 'BVB';
  static const String VIETCOMBANK = 'VCB';
  static const String VIETINBANK = 'CTG';
  static const String VPBANK = 'VPB';
  static const String VRB = 'VRB';
  static const String WOORI_BANK = 'WRB';
}