import 'dart:developer';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';

class MyUtils {
  MyUtils._();

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  ///Returns random image url
  static String getTempLink({int height = 812, int width = 375}) {
    math.Random rand = math.Random();
    int value = rand.nextInt(height);
    return 'https://picsum.photos/$width/$height?test=$value';
  }

  static ImageProvider buildImageProvider(
    String? imageUrl, [
    String? defaultImage,
  ]) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return AssetImage(defaultImage ?? 'assets/images/profilePH.png');
    }
    try {
      return CachedNetworkImageProvider(
        imageUrl,
        errorListener: (err) {
          log('Error loading image :$err');
        },
      );
    } catch (e) {
      return AssetImage(defaultImage ?? 'assets/images/profilePH.png');
    }
  }

  static String? getUserId() {
    return Get.find<AuthService>().firebaseUser?.uid;
  }

  // static ImageProvider getDummyImageProvider() {
  //   return CachedNetworkImageProvider(getTempLink());
  // }
}
