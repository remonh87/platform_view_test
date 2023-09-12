import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_view_repro_method_channel.dart';

abstract class PlatformViewReproPlatform extends PlatformInterface {
  /// Constructs a PlatformViewReproPlatform.
  PlatformViewReproPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformViewReproPlatform _instance = MethodChannelPlatformViewRepro();

  /// The default instance of [PlatformViewReproPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformViewRepro].
  static PlatformViewReproPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformViewReproPlatform] when
  /// they register themselves.
  static set instance(PlatformViewReproPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
