import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/widgets/parallax/layer.dart';
import 'package:flutter_weather_api_app/widgets/parallax/parallax_sensors.dart';
import 'package:sensors_plus/sensors_plus.dart';

  /// Creates a parallax effect based on the motion and position of the device.
  ///
  /// The type of sensor to detect the motion can be given through **[sensor]**.
  /// The fixed body of the page can be given through **[child]**.
  
class ParallaxSensorBg extends StatefulWidget {
  /// Type of the sensor whose detected values will be used for parallax movement
  ///
  /// **[accelerometer]:**
  /// Discrete reading from an accelerometer. Accelerometers measure the velocity
  /// of the device. Note that these readings include the effects of gravity. Put
  /// simply, you can use accelerometer readings to tell if the device is moving in
  /// a particular direction.
  ///
  /// **[userAccelerometer]:**
  /// Like **[accelerometer]**, this is a discrete reading from an accelerometer
  /// and measures the velocity of the device. However, unlike
  /// **[accelerometer]**, this event does not include the effects of gravity.
  ///
  /// **[gyroscope]:**
  /// Discrete reading from a gyroscope. Gyroscopes measure the rate or rotation of
  /// the device in 3D space.
  ///
  /// **[magnetometer]:**
  /// Magnetometers measure the ambient magnetic field surrounding the sensor,
  /// returning values in microteslas ***μT*** for each three-dimensional axis.
  ///
  /// Consider that these samples may bear effects of Earth's magnetic field as
  /// well as local factors such as the metal of the device itself or nearby
  /// magnets, though most devices compensate for these factors.
  ///
  /// A compass is an example of a general utility for magnetometer data.
  final ParallaxSensor sensor;

  /// Individual layers for the parallax effect.
  ///
  /// The declaration of the layers sequentially are positioned from bottom to top.
  /// For example, in
  /// ```dart
  /// layers: [layer1, layer2, layer3]
  /// ```
  /// where layer1, layer2, layer3 are instances of the class **[Layer]**,
  /// layer1 will be at the bottom
  /// (farthest to viewer from parallax perspective)
  /// followed by layer2 and layer3 will be the topmost
  /// (nearest to viewer from parallax perspective).
  final List<Layer> layers;

  /// Reverses the movement of vertical axis.
  final bool reverseVerticalAxis;

  /// Reverses the movement of horizontal axis.
  final bool reverseHorizontalAxis;

  /// Stops the movement of vertical axis.
  final bool lockVerticalAxis;

  /// Stops the movement of horizontal axis.
  final bool lockHorizontalAxis;

  /// The duration it takes for the movement change to complete.
  /// Decreasing it will make the parallax effect seem discrete and rough.
  /// On the other hand, increasing it too much will make the responsiveness
  /// of the sensor too slow. Ideal value is from 200 to 400.
  final int animationDuration;

  /// The fixed page body above the parallax layer.
  final Widget? child;

  const ParallaxSensorBg({
    super.key,
    this.sensor = ParallaxSensor.accelerometer,
    required this.layers,
    this.reverseVerticalAxis = false,
    this.reverseHorizontalAxis = false,
    this.lockVerticalAxis = false,
    this.lockHorizontalAxis = false,
    this.animationDuration = 300,
    this.child,
  });

  @override
  State<ParallaxSensorBg> createState() => _ParallaxSensorBgState();
}

class _ParallaxSensorBgState extends State<ParallaxSensorBg> {

// AccelerometerEvent comes from sensor_plus package
  StreamSubscription<AccelerometerEvent>? _accelerometerSensorEvent;
  StreamSubscription<UserAccelerometerEvent>? _userAccelerometerSensorEvent;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSensorEvent;
  StreamSubscription<MagnetometerEvent>? _magnetometerSensorEvent;
  double _top = 0, _bottom = 0, _right = 0, _left = 0, _maxSensitivity = 0;

  @override
  void initState() {
    switch (widget.sensor) {
      case ParallaxSensor.accelerometer:
        _accelerometerSensorEvent =
            accelerometerEventStream().listen((AccelerometerEvent event) {
          setState(() {
            _maxSensitivity = 10;
            _top = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? -event.y
                    : event.y;
            _bottom = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? event.y
                    : -event.y;
            _right = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? -event.x
                    : event.x;
            _left = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? event.x
                    : -event.x;
          });
        });
        break;

      case ParallaxSensor.userAccelerometer:
        _userAccelerometerSensorEvent =
            userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
          setState(() {
            _maxSensitivity = 10;
            _top = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? -event.y
                    : event.y;
            _bottom = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? event.y
                    : -event.y;
            _right = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? -event.x
                    : event.x;
            _left = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? event.x
                    : -event.x;
          });
        });
        break;

      case ParallaxSensor.gyroscope:
        _gyroscopeSensorEvent = gyroscopeEventStream().listen((GyroscopeEvent event) {
          setState(() {
            _maxSensitivity = 10;
            _top = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? -event.x
                    : event.x;
            _bottom = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? event.x
                    : -event.x;
            _right = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? event.y
                    : -event.y;
            _left = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? -event.y
                    : event.y;
          });
        });
        break;

      case ParallaxSensor.magnetometer:
        _magnetometerSensorEvent =
            magnetometerEventStream().listen((MagnetometerEvent event) {
          setState(() {
            _maxSensitivity = 50;
            _top = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? -event.y
                    : event.y;
            _bottom = widget.lockVerticalAxis
                ? 0
                : widget.reverseVerticalAxis
                    ? event.y
                    : -event.y;
            _right = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? -event.x
                    : event.x;
            _left = widget.lockHorizontalAxis
                ? 0
                : widget.reverseHorizontalAxis
                    ? event.x
                    : -event.x;
          });
        });
        break;
    }
    super.initState();
  }

  @override
  void dispose() {
    _accelerometerSensorEvent?.cancel();
    _userAccelerometerSensorEvent?.cancel();
    _gyroscopeSensorEvent?.cancel();
    _magnetometerSensorEvent?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: widget.layers
              .map((layer) => layer.buildLayer(context, widget.animationDuration,
                  _maxSensitivity, _top, _bottom, _right, _left))
              .toList(),
        ),
        widget.child ?? Container(),
      ],
    );
  }
}