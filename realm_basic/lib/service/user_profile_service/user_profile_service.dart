import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';
import '../realm_base_service/realm_base_service.dart';

class UserProfileService extends RealmBaseService<UserProfile> {
  static UserProfileService? _instance;
  static UserProfileService get instance {
    _instance ??= UserProfileService();
    return _instance!;
  }

  UserProfileService() {
    realm = Realm(Configuration.flexibleSync(AuthService.currentUser!, [
      UserProfile.schema,
    ]));
  }

  @override
  Stream<RealmResultsChanges<UserProfile>> snapshot() {
    return UserProfileService.instance.realm
        .query<UserProfile>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  Stream<RealmResultsChanges<UserProfile>> currentUserSnapshot() {
    return UserProfileService.instance.realm
        .query<UserProfile>("user_id == '${AuthService.currentUser!.id}'")
        .changes;
  }

  UserProfile me() {
    return UserProfileService.instance.realm
        .query<UserProfile>("user_id == '${AuthService.currentUser!.id}'")
        .first;
  }

  initUserProfile() async {
    var item = UserProfile(
      ObjectId(),
      AuthService.currentUser!.id,
      AuthService.currentUser!.profile.name ?? "-",
      AuthService.currentUser!.profile.pictureUrl ??
          "https://i.ibb.co/S32HNjD/no-image.jpg",
      AuthService.currentUser!.profile.email ?? "-",
      "User",
    );

    realm.write(() {
      var res = UserProfileService.instance.get(
        query: "user_id == '${AuthService.currentUser!.id}'",
      );

      if (res.isEmpty) {
        realm.add(item);
        print("New user created!");
        return;
      }

      UserProfile userProfile = (res.first as UserProfile);
      userProfile = item;
      print("User data is updated!");
    });
  }

  Future<void> updateProfile({
    String? photo,
    String? name,
  }) async {
    realm.write(() {
      var me = UserProfileService.instance.me();
      me.name = name ?? me.name;
      me.photo = photo ?? me.photo;
      print("Updated!");
    });
  }

  @override
  add(UserProfile item) async {
    realm.write(() {
      realm.add(item);
    });
    print("New user created!");
  }

  @override
  delete(UserProfile item) {
    realm.write(() async {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(UserProfile item) async {
    realm.write(() {
      item = item;
    });
  }
}
