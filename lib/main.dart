import 'package:flutter/material.dart';
import 'package:cavalo_trucado/pages/Splash/splash.dart';

void main() {
  runApp(const OnAccess());
}

class OnAccess extends StatefulWidget {
  const OnAccess({super.key});

  @override
  State<OnAccess> createState() => _OnAccessState();
}

class _OnAccessState extends State<OnAccess> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
