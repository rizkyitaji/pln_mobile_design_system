import 'package:flutter/material.dart';

abstract class AppRadius {
  AppRadius._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double full = 100;

  static BorderRadius get rounded8 => BorderRadius.circular(xs);
  static BorderRadius get rounded12 => BorderRadius.circular(sm);
  static BorderRadius get rounded16 => BorderRadius.circular(md);
  static BorderRadius get rounded24 => BorderRadius.circular(lg);
  static BorderRadius get rounded32 => BorderRadius.circular(xl);
  static BorderRadius get rounded48 => BorderRadius.circular(xxl);
  static BorderRadius get rounded => BorderRadius.circular(full);

  static BorderRadius get topRounded12 =>
      BorderRadius.vertical(top: Radius.circular(AppRadius.sm));
  static BorderRadius get topRounded16 =>
      BorderRadius.vertical(top: Radius.circular(AppRadius.md));
}
