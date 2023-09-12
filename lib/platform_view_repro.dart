
import 'platform_view_repro_platform_interface.dart';

class PlatformViewRepro {
  Future<String?> getPlatformVersion() {
    return PlatformViewReproPlatform.instance.getPlatformVersion();
  }
}
