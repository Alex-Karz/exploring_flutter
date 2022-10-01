import 'package:flutter/material.dart';

class BubbleModelNotifier extends ChangeNotifier {
  bool sizeUp = false;

  void resize({required bool sizeUp}) {
    if (sizeUp) {
      sizeUp = true;
      notifyListeners();
    }
  }
}
