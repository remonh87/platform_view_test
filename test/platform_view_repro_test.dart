import 'package:flutter_test/flutter_test.dart';
import 'package:platform_view_repro/platform_view_repro.dart';
import 'package:platform_view_repro/platform_view_repro_platform_interface.dart';
import 'package:platform_view_repro/platform_view_repro_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformViewReproPlatform
    with MockPlatformInterfaceMixin
    implements PlatformViewReproPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformViewReproPlatform initialPlatform = PlatformViewReproPlatform.instance;

  test('$MethodChannelPlatformViewRepro is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformViewRepro>());
  });

  test('getPlatformVersion', () async {
    PlatformViewRepro platformViewReproPlugin = PlatformViewRepro();
    MockPlatformViewReproPlatform fakePlatform = MockPlatformViewReproPlatform();
    PlatformViewReproPlatform.instance = fakePlatform;

    expect(await platformViewReproPlugin.getPlatformVersion(), '42');
  });
}
