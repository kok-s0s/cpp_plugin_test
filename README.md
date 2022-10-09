<details><summary>old</summary>

# cpp_plugin_test

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

</details>

# Type

<details><summary>Integer</summary>

| C                  | NativeType's SubType | Dart's Type | Test |
| :----------------- | :------------------- | :---------: | :--: |
| int8_t             | Int8                 |     int     |  √   |
| int16_t            | Int16                |     int     |  √   |
| int32_t            | Int32                |     int     |  √   |
| int64_t            | Int64                |     int     |  √   |
| uint8_t            | Uint8                |     int     |  √   |
| uint16_t           | Uint16               |     int     |  √   |
| uint32_t           | Uint32               |     int     |  √   |
| uint64_t           | Uint64               |     int     |  ×   |
| int                | Int                  |     int     |  √   |
| long               | Long                 |     int     |  √   |
| long long          | LongLong             |     int     |  √   |
| short              | Short                |     int     |  √   |
| unsigned int       | UnsignedInt          |     int     |  √   |
| unsigned long      | UnsignedLong         |     int     |  ×   |
| unsigned long long | UnsignedLongLong     |     int     |  ×   |
| unsigned short     | UnsignedShort        |     int     |  √   |

</details>

<details><summary>Struct</summary>

## 参考链接

[Struct class](https://api.dart.cn/dev/2.19.0-248.0.dev/dart-ffi/Struct-class.html)

[Flutter FFI 结构体](https://blog.csdn.net/eieihihi/article/details/119219348)

[Flutter Platform Channel 和 FFI 通道性能测试](https://www.xdea.xyz/2020/11/flutter-platform-channel-%e6%80%a7%e8%83%bd%e6%b5%8b%e8%af%95/)

---

过程：

1. 编写 C++ 相关代码（结构体），这里为简单的定义以及一个创建新结构体对象的函数；
2. 在这个 `lib/cpp_plugin_test.dart` 文件中做数据类型转换的操作（bindings），示例如下：

注意：dart 代码中的类要与 C++ 中类的属性一一对应；

```dart
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
```

```dart
final DynamicLibrary typeLib = Platform.isAndroid
    ? DynamicLibrary.open("libtype.so")
    : DynamicLibrary.process();

final dart的函数返回值 Function(dart的参数类型 ...) dart中使用时的函数名 = typeLib
    .lookup<NativeFunction<ffi库的类型 Function(ffi库的类型的参数 ...)>>("C++代码中对应的函数名")
    .asFunction();
```

3. 修改 `example/lib/main.dart`，在里面调用 C++ 生成的函数。（注意 FFI 库的数据类型转换，特别是字符串）

</details>
