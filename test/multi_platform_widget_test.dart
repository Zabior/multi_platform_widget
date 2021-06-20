import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:multi_platform_widget/multi_platform_widget.dart';

void main() {
  group('testing widgets on specific platforms', () {
    testWidgets('android', (tester) async {
      await testPlatform(
        tester,
        'android',
        _getPlatformWidget(TargetPlatform.android),
      );
    });
    testWidgets('fuchsia', (tester) async {
      await testPlatform(
        tester,
        'fuchsia',
        _getPlatformWidget(TargetPlatform.fuchsia),
      );
    });
    testWidgets('ios', (tester) async {
      await testPlatform(
        tester,
        'ios',
        _getPlatformWidget(TargetPlatform.iOS),
      );
    });
    testWidgets('linux', (tester) async {
      await testPlatform(
        tester,
        'linux',
        _getPlatformWidget(TargetPlatform.linux),
      );
    });
    testWidgets('mac', (tester) async {
      await testPlatform(
        tester,
        'mac',
        _getPlatformWidget(TargetPlatform.macOS),
      );
    });
    testWidgets('windows', (tester) async {
      await testPlatform(
        tester,
        'windows',
        _getPlatformWidget(TargetPlatform.windows),
      );
    });
  });
}

testPlatform(WidgetTester tester, String platform, Widget widget) async {
  await tester.pumpWidget(widget);
  expect(find.text(platform), findsOneWidget);
  await tester.pumpWidget(NullTestWidget());
  expect(find.text('default'), findsOneWidget);
}

Widget _getPlatformWidget(TargetPlatform targetPlatform) {
  return MaterialApp(
    theme: ThemeData(platform: targetPlatform),
    home: TestWidget(),
  );
}

class TestWidget extends MultiPlatformWidget {
  @override
  Widget get defaultWidget => Text('default', textDirection: TextDirection.ltr);

  @override
  Widget? get androidWidget => Text(
        'android',
        textDirection: TextDirection.ltr,
      );

  @override
  Widget? get fuchsiaWidget => Text(
        'fuchsia',
        textDirection: TextDirection.ltr,
      );

  @override
  Widget? get iOSWidget => Text('ios', textDirection: TextDirection.ltr);

  @override
  Widget? get linuxWidget => Text('linux', textDirection: TextDirection.ltr);

  @override
  Widget? get macOSWidget => Text('mac', textDirection: TextDirection.ltr);

  @override
  Widget? get windowsWidget => Text(
        'windows',
        textDirection: TextDirection.ltr,
      );

  @override
  Widget? get webWidget => Text('web', textDirection: TextDirection.ltr);
}

class NullTestWidget extends MultiPlatformWidget {
  @override
  Widget get defaultWidget => Text('default', textDirection: TextDirection.ltr);
}
