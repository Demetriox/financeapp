import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveSize {
  late double width;
  late double height;
  late double hypotenuse;

  ResponsiveSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    hypotenuse = math.sqrt(math.pow(width, 2) + math.pow(height, 2));
  }

  double widthResp(double percent) {
    return width * percent / 100;
  }

  double heightResp(double percent) {
    return height * percent / 100;
  }

  double hypotenuseResp(double percent) {
    return hypotenuse * percent / 100;
  }
}
