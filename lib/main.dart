import 'package:flutter/material.dart';
import 'package:newsdepi/core/services/set_up_services_locator.dart';

import 'package:newsdepi/feature/home/presentation/views/splashView.dart';

void main() {
  setUp();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: true, home: Splashview());
  }
}
