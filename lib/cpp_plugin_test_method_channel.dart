import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cpp_plugin_test_platform_interface.dart';

/// An implementation of [CppPluginTestPlatform] that uses method channels.
class MethodChannelCppPluginTest extends CppPluginTestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cpp_plugin_test');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
