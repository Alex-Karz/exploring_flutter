import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_advanced_youtube/bubbles_provider.dart';

void main() {
  runApp(NotMyBubbles());
}

class NotMyBubbles extends StatelessWidget {
  NotMyBubbles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, snapshot) {
          final maxHeight = (1.sh - 0.4.sw).round();
          final maxWidth = (1.sw - 0.3.sw).round();
          return MaterialApp(
            home: ChangeNotifierProvider(
              create: (exemplar) => RoundModelEditorNotifier(),
              child: ColoredBox(
                color: Colors.black87,
                child: SafeArea(
                  child: Stack(
                    children: [
                      for (var index = 0; index < 69; index++)
                        Positioned(
                          top: 5 + Random().nextInt(maxHeight).toDouble(),
                          left: 0 + Random().nextInt(maxWidth).toDouble(),
                          child: RoundWithActionWidget(
                            color: Color.fromRGBO(
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255),
                                0.9),
                            size: 0.1 +
                                Random().nextInt(30).toDouble() / 100 * 1.sw,
                            removeBubble: false,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class RoundModelEditorNotifier extends ChangeNotifier {
  bool downsize = false;

  void editSize({required bool resize}) {
    downsize = false;
    if (resize) {
      downsize = true;
      notifyListeners();
    }
  }
}
