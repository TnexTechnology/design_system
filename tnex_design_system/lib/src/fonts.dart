import 'package:flutter/material.dart';

const fontQuickSandBold = 'QuickSand-Bold';
const fontQuickSandRegular = 'QuickSand-Regular';

const fontRoboBoldMonoSpaced = 'Robo-Bold-Mono';
const fontQuickSandMedium = 'QuickSand-Medium';
const fontQuickSandSemiBold = 'QuickSand-SemiBold';

const fontLight = 'QuickSand-Regular';
const fontRegular = 'QuickSand-Regular';
const fontMedium = 'QuickSand-Regular';
const fontSemibold = 'QuickSand-Bold';
const fontBold = 'QuickSand-Bold';
enum FontStyle {
  regular,
  medium,
  semibold,
  bold
}

extension on FontStyle {
  FontWeight fontWeight() {
    return FontWeight.w900;
  }
}

enum TnexTypography {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  body18Semi,
  body18Med,
  body18Reg,
  body16Semi,
  body16Med,
  body16Reg,
  body14Semi,
  body14Med,
  body14Reg,
  body12Semi,
  body12Med,
  body12Reg
}

enum ErrorCode {
  None,
  Unknown,
  ConnectionLost,
  OutlierReading,
}

extension on ErrorCode {
  static final values = {
    ErrorCode.None: 0,
    ErrorCode.Unknown: 1,
    ErrorCode.ConnectionLost: 100,
    ErrorCode.OutlierReading: 200,
  };

  int? get value => values[this];
}

extension on TnexTypography {
  static final _sizes = {
    TnexTypography.heading1: 40.0,
    TnexTypography.heading2: 32.0,
    TnexTypography.heading3: 24.0,
    TnexTypography.heading4: 20.0,
    TnexTypography.heading5: 18.0,
    TnexTypography.heading6: 16.0,
    TnexTypography.body18Semi: 18.0,
    TnexTypography.body18Med: 18.0,
    TnexTypography.body18Reg: 18.0,
    TnexTypography.body16Semi: 16.0,
    TnexTypography.body16Med: 16.0,
    TnexTypography.body16Reg: 16.0,
    TnexTypography.body14Semi: 14.0,
    TnexTypography.body14Med: 14.0,
    TnexTypography.body14Reg: 14.0,
    TnexTypography.body12Semi: 12.0,
    TnexTypography.body12Med: 12.0,
    TnexTypography.body12Reg: 12.0
    };

  static final _weights = {
    TnexTypography.heading1: FontWeight.w700,
    TnexTypography.heading2: FontWeight.w700,
    TnexTypography.heading3: FontWeight.w700,
    TnexTypography.heading4: FontWeight.w700,
    TnexTypography.heading5: FontWeight.w700,
    TnexTypography.heading6: FontWeight.w700,
    TnexTypography.body18Semi: FontWeight.w600,
    TnexTypography.body18Med: FontWeight.w500,
    TnexTypography.body18Reg: FontWeight.w400,
    TnexTypography.body16Semi: FontWeight.w600,
    TnexTypography.body16Med: FontWeight.w500,
    TnexTypography.body16Reg: FontWeight.w400,
    TnexTypography.body14Semi: FontWeight.w600,
    TnexTypography.body14Med: FontWeight.w500,
    TnexTypography.body14Reg: FontWeight.w400,
    TnexTypography.body12Semi: FontWeight.w600,
    TnexTypography.body12Med: FontWeight.w500,
    TnexTypography.body12Reg: FontWeight.w400
  };

  double get fontSize => _sizes[this] ?? 14.0;
  FontWeight? get fontWeight => _weights[this];
}



TextStyle textStyle(TnexTypography typo, {Color color = Colors.white}) {
  return TextStyle(
    fontFamily: 'QuickSand-Regular',
    fontSize: typo.fontSize,
    fontWeight: typo.fontWeight,
    color: color
  );
}