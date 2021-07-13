import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/config/route_generator.dart';
import 'package:starterz/provider/providers.dart';
import 'package:starterz/screen/auth/page/auth_page.dart';

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .read(backendClientProvider)
        .whenData((value) => print('BackendClient initialized...'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starterz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: AuthPage(),
    );
  }
}
