import 'cpp_plugin_test_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

final DynamicLibrary typeLib = Platform.isAndroid
    ? DynamicLibrary.open("libtype.so")
    : DynamicLibrary.process();

final int Function() typeInt32 =
    typeLib.lookup<NativeFunction<Int32 Function()>>("type_int32").asFunction();

class CppPluginTest {
  Future<String?> getPlatformVersion() {
    return CppPluginTestPlatform.instance.getPlatformVersion();
  }
}
