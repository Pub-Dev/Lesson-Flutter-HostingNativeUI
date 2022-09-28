import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final String viewType = 'native-view';
  final Map<String, dynamic> creationParams = {
    'title': 'Pub Dev',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('teste de acessibilidade'),
          Expanded(
            child: getNativeUI(),
          ),
        ],
      ),
    );
  }

  Widget getNativeUI() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return AndroidView(
        //   viewType: viewType,
        //   layoutDirection: TextDirection.ltr,
        //   creationParams: creationParams,
        //   creationParamsCodec: const StandardMessageCodec(),
        // );
        return PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (context, platformViewController) {
            return AndroidViewSurface(
              controller: platformViewController as AndroidViewController,
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
            );
          },
          onCreatePlatformView: (params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        throw UnsupportedError('error');
    }
  }
}
