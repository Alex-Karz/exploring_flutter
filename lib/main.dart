import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_advanced_youtube/balls.dart';
import 'package:provider_app_advanced_youtube/bubbles_provider.dart';

void main() {
  runApp(const BallsApp());
}

class BallsApp extends StatelessWidget {
  const BallsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, snapshot) {
          return ChangeNotifierProvider(
            create: (context) => BubbleModelNotifier(),
            child: Consumer<BubbleModelNotifier>(
              builder: (context, model, child) {
                return MaterialApp(
                  home: Container(
                    height: 1.sh,
                    width: 1.sw,
                    color: Colors.black87,
                    child: Stack(
                      children: [
                        for (var index = 0; index < 69; index++)
                          Balls(
                            color: Color.fromRGBO(
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255),
                                0.8),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
