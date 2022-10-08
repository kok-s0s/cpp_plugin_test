import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cpp_plugin_test_method_channel.dart';

abstract class CppPluginTestPlatform extends PlatformInterface {
  /// Constructs a CppPluginTestPlatform.
  CppPluginTestPlatform() : super(token: _token);

  static final Object _token = Object();

  static CppPluginTestPlatform _instance = MethodChannelCppPluginTest();

  /// The default instance of [CppPluginTestPlatform] to use.
  ///
  /// Defaults to [MethodChannelCppPluginTest].
  static CppPluginTestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CppPluginTestPlatform] when
  /// they register themselves.
  static set instance(CppPluginTestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
