import 'dart:math';

import 'package:flutter/material.dart';

const Color lightBlue = Color(0xFF40cbd8);
const Color lightPrimary = Color(0xFF000000);
const Color lightSecondary = Color(0xFF86878d);
const Color lightTertiary = Color(0xFFbdbfc4);
const Color lightQuaternary = Color(0xFFd3d5da);

const Color darkPrimary = Color(0xFFFFFFFF);
const Color darkSecondary = Color(0xFFa19eb7);
const Color darkQuaternary = Color(0xFF696489);
const Color darkTertiary = Color(0xFF524e77);

const Color solidPurple = Color(0xFF48319D);
const Color solidDarkPurple = Color(0xFF1F1D47);
const Color solidBrightPurple = Color(0xFFC427FB);
const Color solidLightPurple = Color(0xFFE0D9FF);

const LinearGradient darkPurple = LinearGradient(
    colors: [Color.fromARGB(197, 46, 51, 90), Color.fromARGB(195, 28, 27, 51)]);

const LinearGradient purple =
    LinearGradient(colors: [Color(0xFF5936B4), Color(0XFF362A84)]);

const LinearGradient bluePurple =
    LinearGradient(colors: [Color(0xFF3658B1), Color(0xFFC159EC)]);

const LinearGradient lightDarkBlue =
    LinearGradient(colors: [Color(0xFFAEC9FF), Color(0xFF083072)]);

const RadialGradient radial =
    RadialGradient(colors: [Color(0xFFF7CBFD), Color(0xFF7758D1)]);

const SweepGradient whitePurple = SweepGradient(
    startAngle: 0,
    endAngle: pi * 2,
    colors: [
      Color(0xFF612FAB),
      Color(0xFFFFFFFF),
      Color(0xFF612FAB),
      Color(0xFFFFFFFF),
    ],
    transform: GradientRotation(pi / 2));
