import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_view_repro_platform_interface.dart';

/// An implementation of [PlatformViewReproPlatform] that uses method channels.
class MethodChannelPlatformViewRepro extends PlatformViewReproPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_view_repro');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
