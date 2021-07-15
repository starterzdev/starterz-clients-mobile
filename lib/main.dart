import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/app.dart';
import 'package:starterz/config/provider_logger.dart';

void main() {
  final ProviderObserver loggerObserver = ProviderLogger();
  runApp(ProviderScope(observers: [loggerObserver], child: App()));
}
