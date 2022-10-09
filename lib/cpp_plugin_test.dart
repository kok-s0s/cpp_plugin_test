import 'cpp_plugin_test_platform_interface.dart';

import 'dart:ffi';
import 'dart:io';

final DynamicLibrary typeLib = Platform.isAndroid
    ? DynamicLibrary.open("libtype.so")
    : DynamicLibrary.process();

final int Function() typeInt8 =
    typeLib.lookup<NativeFunction<Int8 Function()>>("type_int8").asFunction();

final int Function() typeInt16 =
    typeLib.lookup<NativeFunction<Int16 Function()>>("type_int16").asFunction();

final int Function() typeInt32 =
    typeLib.lookup<NativeFunction<Int32 Function()>>("type_int32").asFunction();

final int Function() typeInt64 =
    typeLib.lookup<NativeFunction<Int64 Function()>>("type_int64").asFunction();

final int Function() typeUint8 =
    typeLib.lookup<NativeFunction<Uint8 Function()>>("type_uint8").asFunction();

final int Function() typeUint16 = typeLib
    .lookup<NativeFunction<Uint16 Function()>>("type_uint16")
    .asFunction();

final int Function() typeUint32 = typeLib
    .lookup<NativeFunction<Uint32 Function()>>("type_uint32")
    .asFunction();

final int Function() typeUint64 = typeLib
    .lookup<NativeFunction<Uint64 Function()>>("type_uint64")
    .asFunction();

final int Function() typeInt =
    typeLib.lookup<NativeFunction<Int Function()>>("type_int").asFunction();

final int Function() typeLong =
    typeLib.lookup<NativeFunction<Long Function()>>("type_long").asFunction();

final int Function() typeLongLong = typeLib
    .lookup<NativeFunction<LongLong Function()>>("type_long_long")
    .asFunction();

final int Function() typeShort =
    typeLib.lookup<NativeFunction<Short Function()>>("type_short").asFunction();

final int Function() typeUnsignedInt = typeLib
    .lookup<NativeFunction<UnsignedInt Function()>>("type_unsigned_int")
    .asFunction();

final int Function() typeUnsignedLong = typeLib
    .lookup<NativeFunction<UnsignedLong Function()>>("type_unsigned_long")
    .asFunction();

final int Function() typeUnsignedLongLong = typeLib
    .lookup<NativeFunction<UnsignedLongLong Function()>>(
        "type_unsigned_long_long")
    .asFunction();

final int Function() typeUnsignedShort = typeLib
    .lookup<NativeFunction<UnsignedShort Function()>>("type_unsigned_short")
    .asFunction();

class Person extends Struct {
  external Pointer<Int8> name;

  @Int32()
  external int age;

  @Double()
  external double weight;

  @Double()
  external double height;
}

final Person Function(Pointer<Int8> name, int age, double weight, double height)
    initPerson = typeLib
        .lookup<
            NativeFunction<
                Person Function(Pointer<Int8> name, Int32 age, Double weight,
                    Double height)>>("init_person")
        .asFunction();

final Pointer<Person> Function(
        Pointer<Int8> name, int age, double weight, double height)
    initPersonPointer = typeLib
        .lookup<
            NativeFunction<
                Pointer<Person> Function(Pointer<Int8> name, Int32 age,
                    Double weight, Double height)>>("init_person_pointer")
        .asFunction();

final void Function(Pointer<Person>) changePersonAge = typeLib
    .lookup<NativeFunction<Void Function(Pointer<Person>)>>("change_person_age")
    .asFunction();

class CppPluginTest {
  Future<String?> getPlatformVersion() {
    return CppPluginTestPlatform.instance.getPlatformVersion();
  }
}
