
import 'cpp_plugin_test_platform_interface.dart';

class CppPluginTest {
  Future<String?> getPlatformVersion() {
    return CppPluginTestPlatform.instance.getPlatformVersion();
  }
}
