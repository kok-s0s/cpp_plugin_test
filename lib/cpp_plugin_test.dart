import 'cpp_plugin_test_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

final DynamicLibrary cxxToFFILib = Platform.isAndroid
    ? DynamicLibrary.open("libcxxToFFI.so")
    : DynamicLibrary.process();

class Person extends Struct {
  external Pointer<Int8> name;

  @Int32()
  external int age;

  @Double()
  external double weight;

  @Double()
  external double height;
}

final Pointer<Person> Function() init = cxxToFFILib
    .lookup<NativeFunction<Pointer<Person> Function()>>("init")
    .asFunction();

final void Function(Pointer<Int8> name) setPersonName = cxxToFFILib
    .lookup<NativeFunction<Void Function(Pointer<Int8> name)>>("setPersonName")
    .asFunction();

final Pointer<Int8> Function() getPersonName = cxxToFFILib
    .lookup<NativeFunction<Pointer<Int8> Function()>>("getPersonName")
    .asFunction();

final void Function(int age) setPersonAge = cxxToFFILib
    .lookup<NativeFunction<Void Function(Int32 age)>>("setPersonAge")
    .asFunction();

final int Function() getPersonAge = cxxToFFILib
    .lookup<NativeFunction<Int Function()>>("getPersonAge")
    .asFunction();

final void Function(double weight) setPersonWeight = cxxToFFILib
    .lookup<NativeFunction<Void Function(Double weight)>>("setPersonWeight")
    .asFunction();

final double Function() getPersonWeight = cxxToFFILib
    .lookup<NativeFunction<Double Function()>>("getPersonWeight")
    .asFunction();

final void Function(double height) setPersonHeight = cxxToFFILib
    .lookup<NativeFunction<Void Function(Double weight)>>("setPersonHeight")
    .asFunction();

final double Function() getPersonHeight = cxxToFFILib
    .lookup<NativeFunction<Double Function()>>("getPersonHeight")
    .asFunction();

class CppPluginTest {
  Future<String?> getPlatformVersion() {
    return CppPluginTestPlatform.instance.getPlatformVersion();
  }
}
