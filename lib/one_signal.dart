import 'dart:developer';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class AppOneSignalController {
  Future initPlatformState() async{
    try{
      await OneSignal.shared.setAppId("cb8e4e73-677c-4c6a-a68b-ded7efca1577");
      OneSignal.shared
          .promptUserForPushNotificationPermission(fallbackToSettings: false)
          .then((accepted) async {
        print('Cliente aceitou permissão: $accepted');
      });
    }
    catch(e,s){
      print(e);
      print(s);
      log("Erro ao configurar OneSignal");
    }
  }
}
