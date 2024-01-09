import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
