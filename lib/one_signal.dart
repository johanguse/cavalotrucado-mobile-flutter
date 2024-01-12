import 'dart:developer';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppOneSignalController {
  Future initPlatformState() async {
    try {
      // Initialize OneSignal
      OneSignal.initialize("cb8e4e73-677c-4c6a-a68b-ded7efca1577");

      // Clear all notifications (optional)
      OneSignal.Notifications.clearAll();

      // Setting Listeners
      OneSignal.Notifications.addPermissionObserver((state) {
        log('Cliente aceitou permissão: ${state.toString()}');
      });

      // Request permission for push notifications
      OneSignal.Notifications.requestPermission(true);

      // Add more listeners and handlers as per your requirements

    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      log("Erro ao configurar OneSignal");
    }
  }
}
