import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/utils/lottie_files.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay {
  static final LoadingOverlay _instance = LoadingOverlay._internal();
  factory LoadingOverlay() => _instance;

  LoadingOverlay._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    _overlayEntry = OverlayEntry(
      builder:
          (_) => Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Lottie.asset(
                    LottieFiles.loading,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
    );

    final overlay = Navigator.of(context, rootNavigator: true).overlay;
    if (overlay == null) {
      throw Exception("No Overlay widget found in the widget tree.");
    }

    overlay.insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

_showLoadingOverlay([BuildContext? context]) {
  context ??= Get.context;
  if (context == null) {
    throw Exception("Context is null");
  }
  LoadingOverlay().show(context);
}

_hideLoadingOverlay() {
  LoadingOverlay().hide();
}

set isAppLoading(bool value) {
  if (value) {
    _showLoadingOverlay();
  } else {
    _hideLoadingOverlay();
  }
}
