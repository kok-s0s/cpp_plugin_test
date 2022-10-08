import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cpp_plugin_test/cpp_plugin_test_method_channel.dart';

void main() {
  MethodChannelCppPluginTest platform = MethodChannelCppPluginTest();
  const MethodChannel channel = MethodChannel('cpp_plugin_test');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
