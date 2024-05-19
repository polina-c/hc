import 'package:flutter/material.dart';

class AppScreen {
  final VoidCallback? fabCallback;
  final String? fabLabel;
  final WidgetBuilder content;

  const AppScreen(
    this.content, {
    this.fabCallback,
    this.fabLabel,
  });
}
