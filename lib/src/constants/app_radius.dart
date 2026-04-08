import 'package:flutter/material.dart';

abstract class AppRadius {
  AppRadius._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double xl = 48;
  static const double full = 100;

  static BorderRadius get rounded8 => BorderRadius.circular(xs);
  static BorderRadius get rounded12 => BorderRadius.circular(sm);
  static BorderRadius get rounded16 => BorderRadius.circular(md);
  static BorderRadius get rounded48 => BorderRadius.circular(xl);
  static BorderRadius get rounded => BorderRadius.circular(full);

  static BorderRadius get topRounded16 =>
      BorderRadius.vertical(top: Radius.circular(16));
}
