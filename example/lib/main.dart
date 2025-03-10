import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:advy_flutter_sdk/advy_flutter_sdk.dart';

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
  final _advyFlutterSdkPlugin = AdvyFlutterSdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool? data = await _advyFlutterSdkPlugin.init(appId: "x6eb6oo1ykqvd4vc",appKey: "teufhx6nodzd13l2sikr");
    setState(() {
      _platformVersion = "data.toString()";
    });
    await Future.delayed(Duration(seconds: 2));
    String? data2 = await _advyFlutterSdkPlugin.getDeepLinkData();
    setState(() {
      _platformVersion = data2.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
