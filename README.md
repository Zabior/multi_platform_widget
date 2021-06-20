# multi_platform_widget

A widget which you can use when you want to provide different widget for each platform. It merges widgets for every platform into single class.

## Usage

Fully working example in `example/lib/main.dart`

```dart
class MyWidget extends MultiPlatformWidget {
  // It is not necessary to specify a widget for every platform.
  // If widgets for some platforms are not specified, then default widget
  // will be built on those platforms.

  @override
  Widget get defaultWidget => DefaultWidget();

  @override
  Widget? get androidWidget => AndroidWidget();

  @override
  Widget? get fuchsiaWidget => FuchsiaWidget();

  @override
  Widget? get iOSWidget => IOSWidget();

  @override
  Widget? get linuxWidget => LinuxWidget();

  @override
  Widget? get macOSWidget => MacOSWidget();

  @override
  Widget? get windowsWidget => WindowsWidget();

  @override
  Widget? get webWidget => WebWidget();
}
```
