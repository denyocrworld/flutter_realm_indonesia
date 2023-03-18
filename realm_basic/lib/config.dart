import 'package:realm_basic/service/user_profile_service/user_profile_service.dart';

class Config {
  static String appId = "application-0-hgyrw";
  static String appUrl =
      "https://realm.mongodb.com/groups/641110674b640877fbed7c0a/apps/64111100d00499994aadea7e";

  //-------------
  static String baseUrl = "https://realm.mongodb.com";
  static String dataSourceName = "mongodb-atlas";
}

class RealmSyncronizer {
  static syncronize() async {
    await UserProfileService.instance.syncronize();
  }
}
