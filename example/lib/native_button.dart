import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NativeButton extends StatefulWidget {
  const NativeButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  static const _viewType = 'com.remonh87/native_button';

  @override
  // ignore: library_private_types_in_public_api
  _NativeButtonState createState() => _NativeButtonState();

  final VoidCallback onTap;
}

class _NativeButtonState extends State<NativeButton> {
  final Map<String, dynamic> _creationParams = {};
  MethodChannel? _methodChannel;

  void onPlatformViewCreated(int viewId) {
    _methodChannel = MethodChannel('com.remonh87/nativebutton/$viewId');
    _methodChannel?.setMethodCallHandler((call) async {
      if (call.method == 'onPressed') {
        widget.onTap.call();
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        );
      },
      onCreatePlatformView: (params) {
        onPlatformViewCreated(params.id);
        return PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: NativeButton._viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: _creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
      viewType: NativeButton._viewType,
    );
  }
}

// ignore: constant_identifier_names
enum GooglePayButtonType { standard, pay }
