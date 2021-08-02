import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:starterz/app.dart';
import 'package:starterz/config/provider_logger.dart';

final secureStorage = FlutterSecureStorage();

void main() {
  final ProviderObserver loggerObserver = ProviderLogger();
  runApp(ProviderScope(observers: [loggerObserver], child: App()));
}
