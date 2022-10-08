import 'cpp_plugin_test_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

final DynamicLibrary nativeSayHelloLib = Platform.isAndroid
    ? DynamicLibrary.open("libhello.so")
    : DynamicLibrary.process();

final int Function() sayHello = nativeSayHelloLib
    .lookup<NativeFunction<Int32 Function()>>("say_hello")
    .asFunction();

class CppPluginTest {
  Future<String?> getPlatformVersion() {
    return CppPluginTestPlatform.instance.getPlatformVersion();
  }
}
