import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cavalo_trucado/utils/route_generator.dart';
import 'package:cavalo_trucado/screens/splash/splash.dart';
import 'package:cavalo_trucado/screens/home/home.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    _lockOrientation();
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
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

void _lockOrientation() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
