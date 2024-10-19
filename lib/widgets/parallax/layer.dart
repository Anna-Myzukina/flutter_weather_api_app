import 'dart:ui';
import 'package:flutter/material.dart';

/// A layer of the parallax.
  ///
  /// Image can be given through **[image]** parameter.
  /// Any widgets can be given through **[child]** parameter.
  ///
  /// ---
  /// **Note:** Image can also be given through **[child]** widget.
  /// But a separate **[image]** parameter is given along with its related controls
  /// (*[imageFit]*, *[preventCrop]*, *[imageHeight]*, *[imageWidth]*, *[imageBlurValue]*,
  /// *[imageDarkenValue]e*) for simpler use.
  
class  Layer {
  /// Moving sensitivity of the layer. The sensitivity of the layers
  /// (from bottom to top from parallax perspective)
  /// should be in increasing order.
  final double sensitivity;

  /// Position of the layer from the center.
  final Offset? offset;

  /// Image that the layer will show.
  ///
  /// By default, the **[image]** will take the size of the screen.
  /// Provide **[imageHeight]** and **[imageWidth]** for the preferred size.
  final ImageProvider<Object>? image;

  /// BoxFit type of the image.
  final BoxFit imageFit;

  /// If set to true, it will ignore the **[imageHeight]** and **[imageWidth]** if given
  /// and will set the height and width of the **[image]** slightly more than the screen size
  /// such that it doesn't get cropped even at the extreme value of the **[sensor]**.
  final bool preventCrop;

  /// Height of the **[image]**.
  ///
  /// ---
  /// **Note:** It will be ignored if **[preventCrop]** is set to true.
  final double? imageHeight;

  /// Width of the **[image]**.
  ///
  /// ---
  /// **Note:** It will be ignored if **[preventCrop]** is set to true.
  final double? imageWidth;

  /// Blurs the **[image]**.
  ///
  /// Value can be any positive fractional number.
  double? imageBlurValue;

  /// Darkens the **[image]**.
  ///
  /// Value ranges from 0 to 1.
  double? imageDarkenValue;

  /// Opacity of the layer.
  ///
  /// Value ranges from 0 to 1.
  double? opacity;

  /// Any widget that will also move.
  final Widget? child;

  /// Function to build the layer.
  /// Set to private to prevent its access from outside this library.
  Layer({
     Key? key,
    required this.sensitivity,
    this.offset,
    this.image,
    this.imageFit = BoxFit.cover,
    this.preventCrop = false,
    this.imageHeight,
    this.imageWidth,
    this.imageBlurValue,
    this.imageDarkenValue,
    this.opacity,
    this.child,
  }) : super();

  /// Function to build the layer.
  /// Set to private to prevent its access from outside this library.
  Widget buildLayer(context, int animationDuration, double maxSensitivity,
          double top, double bottom, double right, double left) =>
      AnimatedPositioned(
        duration: Duration(milliseconds: animationDuration),
        top: (preventCrop
                ? (top - maxSensitivity) * sensitivity
                : (top) * sensitivity +
                    (MediaQuery.of(context).size.height -
                            (imageHeight ??
                                MediaQuery.of(context).size.height)) /
                        2) +
            ((offset?.dy ?? 0) / 2),
        bottom: (preventCrop
                ? (bottom - maxSensitivity) * sensitivity
                : (bottom) * sensitivity +
                    (MediaQuery.of(context).size.height -
                            (imageHeight ??
                                MediaQuery.of(context).size.height)) /
                        2) -
            ((offset?.dy ?? 0) / 2),
        right: (preventCrop
                ? (right - maxSensitivity) * sensitivity
                : (right) * sensitivity +
                    (MediaQuery.of(context).size.width -
                            (imageWidth ?? MediaQuery.of(context).size.width)) /
                        2) -
            ((offset?.dx ?? 0) / 2),
        left: (preventCrop
                ? (left - maxSensitivity) * sensitivity
                : (left) * sensitivity +
                    (MediaQuery.of(context).size.width -
                            (imageWidth ?? MediaQuery.of(context).size.width)) /
                        2) +
            ((offset?.dx ?? 0) / 2),
        child: Opacity(
          opacity: opacity ?? 1,
          child: Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              image: image != null
                  ? DecorationImage(
                      image: image!,
                      fit: imageFit,
                    )
                  : null,
            ),
            child: Stack(
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: imageBlurValue ?? 0,
                        sigmaY: imageBlurValue ?? 0),
                    child: Container(
                      height: imageHeight,
                      width: imageWidth,
                      decoration: BoxDecoration(
                          color:
                              Colors.black.withOpacity(imageDarkenValue ?? 0)),
                    ),
                  ),
                ),
                child ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}