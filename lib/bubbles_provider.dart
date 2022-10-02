import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_advanced_youtube/main.dart';

// ignore: must_be_immutable
class RoundWithActionWidget extends StatelessWidget {
  final Color color;
  double size;
  VoidCallback? stop;
  bool removeBubble;

  RoundWithActionWidget({
    required this.color,
    required this.size,
    required this.removeBubble,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleModel = context.watch<RoundModelEditorNotifier>();
    if (bubbleModel.downsize) {
      size = size * 0.98;
    }
    if (size > 0 && size < 0.05.sw) {
      size = 0;
      removeBubble = true;
    }
    if (size >= 0.98.sw) {
      size = 0;
      removeBubble = true;
    }

    return GestureDetector(
      onTap: () {
        size = size * 1.2;
        bubbleModel.editSize(resize: true);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
        ),
        onEnd: () {
          if (size == 0 && removeBubble) {
            bubbleModel.editSize(resize: true);
          }
        },
      ),
    );
  }
}
