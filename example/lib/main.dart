// ignore_for_file: prefer_typing_uninitialized_variables

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

  var controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {});
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _cppPluginTestPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

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
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${getFlag()}'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setFlag();
                    });
                  },
                  child: const Text("Switch Status"),
                ),
              ],
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('name = ${getPersonName().cast<Utf8>().toDartString()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      var tempName = "";
                      tempName += controller.text;
                      setPersonName(tempName.toNativeUtf8().cast<Int8>());
                    });
                  },
                  child: const Text("New Name"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('age = ${getPersonAge()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonAge(getPersonAge() + 1);
                    });
                  },
                  child: const Text("Add Age"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('weight = ${getPersonWeight()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonWeight(getPersonWeight() + 1.5);
                    });
                  },
                  child: const Text("Add Weight"),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('height = ${getPersonHeight()}\n'),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setPersonHeight(getPersonHeight() + 1.5);
                    });
                  },
                  child: const Text("Add Height"),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
