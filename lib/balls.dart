import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_advanced_youtube/bubbles_provider.dart';

class Balls extends StatefulWidget {
  final Color color;
  double? size;

  Balls({
    super.key,
    required this.color,
    this.size,
  });

  @override
  State<Balls> createState() => _BallsState();
}

class _BallsState extends State<Balls> {
  @override
  Widget build(BuildContext context) {
    var size = 0.1 + Random().nextInt(30) / 100 * 1.sw;
    final bubbleEditorNotifier = context.watch<BubbleModelNotifier>();
    if (bubbleEditorNotifier.sizeUp) {
      size = size * 1.2;
    }

    final maxHeight = (1.sh - 0.4.sw).round();
    final maxWidth = (1.sw - 0.3.sw).round();

    return Positioned(
      top: 45 + Random().nextInt(maxHeight).toDouble(),
      left: 0 + Random().nextInt(maxWidth).toDouble(),
      child: GestureDetector(
        onTap: () {
          bubbleEditorNotifier.resize(sizeUp: true);
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 350),
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: const BorderRadius.all(Radius.circular(200)),
          ),
        ),
      ),
    );
  }
}
