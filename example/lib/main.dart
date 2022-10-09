import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:cpp_plugin_test/cpp_plugin_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _cppPluginTestPlugin = CppPluginTest();

  Person personOne =
      initPerson("Baby".toNativeUtf8().cast<Int8>(), 2, 12.2, 34.2);

  Pointer<Person> personTwo =
      initPersonPointer("man".toNativeUtf8().cast<Int8>(), 33, 66.6, 172.6);

  void _doubleAge() {
    setState(() {
      changePersonAge(personTwo);
      if (personTwo.ref.age == 0 || personTwo.ref.age < 0) {
        personTwo.ref.age = 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _cppPluginTestPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CPP Plugin Test'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            // Text('typs_int8: ${typeInt8()}\n'),
            // Text('typs_int16: ${typeInt16()}\n'),
            // Text('typs_int32: ${typeInt32()}\n'),
            // Text('typs_int64: ${typeInt64()}\n'),
            // Text('typs_uint8: ${typeUint8()}\n'),
            // Text('typs_uint16: ${typeUint16()}\n'),
            // Text('typs_uint32: ${typeUint32()}\n'),
            // Text('typs_uint64: ${typeUint64()}\n'),
            // Text('typs_int: ${typeInt()}\n'),
            // Text('typs_long: ${typeLong()}\n'),
            // Text('typs_long_long: ${typeLongLong()}\n'),
            // Text('typs_short: ${typeShort()}\n'),
            // Text('typs_unsigned_int: ${typeUnsignedInt()}\n'),
            // Text('typs_unsigned_long: ${typeUnsignedLong()}\n'),
            // Text('typs_unsigned_long_long: ${typeUnsignedLongLong()}\n'),
            // Text('typs_unsigned_short: ${typeUnsignedShort()}\n'),
            Text(
                'personOneName = ${personOne.name.cast<Utf8>().toDartString()}\n'),
            Text('personOneAge = ${personOne.age}\n'),
            Text('personOneWeight = ${personOne.weight}\n'),
            Text('personOneHeight = ${personOne.height}\n'),
            Text(
                '(Pointer) personTwoName = ${personTwo.ref.name.cast<Utf8>().toDartString()}\n'),
            Text('(Pointer) personTwoAge = ${personTwo.ref.age}\n'),
            Text('(Pointer) personTwoWeight = ${personTwo.ref.weight}\n'),
            Text('(Pointer) personTwoHeight = ${personTwo.ref.height}\n'),
            const Text(
              'after change personTwoAge, now age is \n',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${personTwo.ref.age}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: _doubleAge,
          tooltip: 'add Age',
          child: const Icon(Icons.add),
        ), //
      ),
    );
  }
}
