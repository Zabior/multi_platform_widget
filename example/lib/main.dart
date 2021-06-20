import 'package:flutter/material.dart';
import 'package:multi_platform_widget/multi_platform_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
          child: ExampleWidget(),
        ),
      ),
    );
  }
}

class ExampleWidget extends MultiPlatformWidget {
  Widget _getText(String text) => Text(
        text,
        style: TextStyle(fontSize: 20),
      );

  @override
  Widget get defaultWidget => _getText('Default');

  @override
  Widget? get androidWidget => _getText('Android');

  @override
  Widget? get fuchsiaWidget => _getText('Fuchsia');

  @override
  Widget? get iOSWidget => _getText('iOS');

  @override
  Widget? get linuxWidget => _getText('Linux');

  @override
  Widget? get macOSWidget => _getText('MacOS');

  @override
  Widget? get windowsWidget => _getText('Windows');

  @override
  Widget? get webWidget => _getText('Web');
}
