import 'package:flutter/material.dart';

class Constant {
  static BorderRadiusDirectional customBorder() {
    return BorderRadiusDirectional.only(
      topEnd: Radius.circular(16),
      topStart: Radius.circular(16),
    );
  }
}
