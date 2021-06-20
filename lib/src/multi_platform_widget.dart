import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A [StatelessWidget] which is dependent on platform.
///
/// By using this class different widget for each platform can be built
/// if it is specified.
abstract class MultiPlatformWidget extends StatelessWidget {
  const MultiPlatformWidget({Key? key}) : super(key: key);

  /// Default widget used on platforms where platform-specific widget is null.
  Widget get defaultWidget;

  /// Widget used on Android.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get androidWidget => null;

  /// Widget used on Fuchsia.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get fuchsiaWidget => null;

  /// Widget used on iOS.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get iOSWidget => null;

  /// Widget used on Linux.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get linuxWidget => null;

  /// Widget used on MacOS.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get macOSWidget => null;

  /// Widget used on Windows.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get windowsWidget => null;

  /// Widget used on web.
  ///
  /// Returns null by default and if it is not overridden
  /// then [defaultWidget] is built on this platform.
  Widget? get webWidget => null;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return webWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.android)
      return androidWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.fuchsia)
      return fuchsiaWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.iOS)
      return iOSWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.linux)
      return linuxWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.macOS)
      return macOSWidget ?? defaultWidget;
    if (Theme.of(context).platform == TargetPlatform.windows)
      return windowsWidget ?? defaultWidget;
    return defaultWidget;
  }
}
