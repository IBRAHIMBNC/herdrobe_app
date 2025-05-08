import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:lottie/lottie.dart'; // Import lottie package
import 'package:shimmer/shimmer.dart';
import 'package:smooth_corner/smooth_corner.dart';

/// A widget that displays images from various sources with loading and error states
class CustomImage extends StatelessWidget {
  /// The image source path (can be a network URL, asset path, or file path)
  final String imagePath;

  /// Widget width
  final double width;

  /// Widget height
  final double height;

  /// How to fit the image within its bounds
  final BoxFit fit;

  /// Border radius for the image
  final dynamic radius;

  /// Background color for the image container
  final Color? backgroundColor;

  /// Widget to display when there's an error loading the image
  final Widget? errorWidget;

  /// Border for the image container
  final BorderSide? border;

  /// Use smooth corners for the border
  final bool useSmoothCorners;

  /// Smoothness factor for corners (1.0 = very smooth, 0.0 = sharp)
  final double smoothness;

  /// Child widget to overlay on top of the image
  final Widget? child;

  /// Image Color
  final Color? color;

  const CustomImage(
    this.imagePath, {
    Key? key,

    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.radius = 12.0,
    this.backgroundColor,
    this.errorWidget,
    this.border,
    this.useSmoothCorners = true,
    this.smoothness = 1.0,
    this.child,
    this.color,
  }) : super(key: key);

  const CustomImage.fromSize(
    this.imagePath, {
    Key? key,
    required double size,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.backgroundColor,
    this.errorWidget,
    this.border,
    this.useSmoothCorners = true,
    this.smoothness = 1.0,
    this.child,
    this.color,
  }) : height = size,
       width = size,
       super(key: key);

  const CustomImage.cirlce(
    this.imagePath, {
    Key? key,
    required double size,
    this.fit = BoxFit.cover,
    this.radius = 200,
    this.backgroundColor,
    this.errorWidget,
    this.border,
    this.useSmoothCorners = true,
    this.smoothness = 1.0,
    this.child,
    this.color,
  }) : height = size,
       width = size,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor ?? Colors.transparent,
        shape: _buildBorderShape(radius, border),
      ),
      // Use a Stack to layer the child on top of the image
      child: Stack(
        fit: StackFit.expand, // Make stack children fill the container
        children: [
          _buildImage(), // Image is the base layer
          if (child != null) child!, // Display child on top if provided
        ],
      ),
    );
  }

  Widget _buildImage() {
    // Check if image path is a Lottie animation
    if (_isLottieAnimation(imagePath)) {
      return Lottie.asset(imagePath, width: width, height: height, fit: fit);
    }
    // Check if image path is an SVG
    if (_isSvgImage(imagePath)) {
      // Check if it's a network SVG
      if (_isNetworkImage(imagePath)) {
        return SvgPicture.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => _buildShimmer(),
          color: color,
        );
      }
      // Check if it's a file SVG
      else if (_isFilePath(imagePath)) {
        return SvgPicture.file(
          File(imagePath),
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => _buildShimmer(),
          color: color,
        );
      }
      // Otherwise treat it as an asset SVG
      else {
        return SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (context) => _buildShimmer(),
          color: color,
        );
      }
    }
    // Check if image path is a network URL (non-SVG)
    else if (_isNetworkImage(imagePath)) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        width: width, // Pass width
        height: height, // Pass height
        fit: fit,
        placeholder: (context, url) => _buildShimmer(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
        color: color,
      );
    }
    // Check if image path is a file path (non-SVG)
    else if (_isFilePath(imagePath)) {
      return Image.file(
        File(imagePath),
        width: width, // Pass width
        height: height, // Pass height
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
        color: color,
      );
    }
    // Otherwise treat it as an asset image (non-SVG)
    else {
      return Image.asset(
        imagePath,
        width: width, // Pass width
        height: height, // Pass height
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
        color: color,
      );
    }
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(width: width, height: height, color: Colors.white),
    );
  }

  Widget _buildErrorWidget() {
    return errorWidget ??
        Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.error_outline, color: Colors.grey),
          ),
        );
  }

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  bool _isFilePath(String path) {
    // Avoid checking existence for network paths or potential asset paths
    if (_isNetworkImage(path) || !_isAbsolutePath(path)) {
      return false;
    }
    try {
      // Check existence only for absolute file paths
      final file = File(path);
      return file.existsSync();
    } catch (e) {
      return false;
    }
  }

  // Helper to check if a path looks like an absolute file path
  bool _isAbsolutePath(String path) {
    // Basic check for common absolute path patterns (adjust as needed for different OS)
    return path.startsWith('/'); // For Unix-like systems
    // Add checks for Windows if necessary: e.g., path.contains(':')
  }

  // Helper method to check if the path is an SVG
  bool _isSvgImage(String path) {
    return path.toLowerCase().endsWith('.svg');
  }

  // Helper method to build the appropriate border shape
  _buildBorderShape(dynamic radius, BorderSide? border) {
    // Convert radius to BorderRadius object
    final BorderRadius borderRadius =
        radius is BorderRadius
            ? radius
            : BorderRadius.circular(radius is num ? radius.toDouble() : 12.0);

    // Return appropriate shape based on useSmoothCorners flag
    return useSmoothCorners
        ? SmoothRectangleBorder(
          borderRadius: borderRadius,
          smoothness: smoothness,
          side: border ?? BorderSide.none,
        )
        : RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: border ?? BorderSide.none,
        );
  }

  // Helper method to check if the path is a Lottie animation
  bool _isLottieAnimation(String path) {
    return path.toLowerCase().endsWith('.json');
  }
}
