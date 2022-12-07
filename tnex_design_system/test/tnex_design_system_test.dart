import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tnex_design_system/tnex_design_system.dart';

void main() {
  const MethodChannel channel = MethodChannel('tnex_design_system');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TnexDesignSystem.platformVersion, '42');
  });
}
