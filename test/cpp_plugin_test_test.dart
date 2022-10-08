import 'package:flutter_test/flutter_test.dart';
import 'package:cpp_plugin_test/cpp_plugin_test.dart';
import 'package:cpp_plugin_test/cpp_plugin_test_platform_interface.dart';
import 'package:cpp_plugin_test/cpp_plugin_test_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCppPluginTestPlatform
    with MockPlatformInterfaceMixin
    implements CppPluginTestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CppPluginTestPlatform initialPlatform = CppPluginTestPlatform.instance;

  test('$MethodChannelCppPluginTest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCppPluginTest>());
  });

  test('getPlatformVersion', () async {
    CppPluginTest cppPluginTestPlugin = CppPluginTest();
    MockCppPluginTestPlatform fakePlatform = MockCppPluginTestPlatform();
    CppPluginTestPlatform.instance = fakePlatform;

    expect(await cppPluginTestPlugin.getPlatformVersion(), '42');
  });
}
