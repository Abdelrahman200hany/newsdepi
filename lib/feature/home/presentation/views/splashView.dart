import 'package:flutter/material.dart';
import 'package:newsdepi/feature/home/presentation/views/home_view.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.newspaper_sharp, size: 64, color: Colors.black),
      ),
    );
  }
}
