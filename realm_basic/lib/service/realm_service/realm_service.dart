import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_basic/config.dart';
import 'package:realm_basic/core.dart';

class RealmService {
  static late App app;
  static late AppConfiguration appConfiguration;
  static init() {
    Map realmConfig = {
      "appId": Config.appId,
      "appUrl": Config.appUrl,
      "baseUrl": Config.baseUrl,
      "dataSourceName": Config.dataSourceName,
    };

    String appId = realmConfig["appId"];
    appConfiguration = AppConfiguration(appId);
    app = App(appConfiguration);
  }

  static bool syncronized = false;
  static Future syncronizeAll() async {
    if (AuthService.currentUser == null) return;
    syncronized = false;
    await RealmSyncronizer.syncronize();
    syncronized = true;
  }
}

extension RealmSyncronizerWidget on Widget {
  syncronizeRealm() {
    if (RealmService.syncronized) return this;
    return FutureBuilder(
      future: RealmService.syncronizeAll(),
      builder: (context, snapshot) {
        return this;
      },
    );
  }
}
