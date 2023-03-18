import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';
import '../realm_base_service/realm_base_service.dart';

class UserProfileService extends RealmBaseService<UserProfile> {
  static UserProfileService? _instance;
  static UserProfileService get instance {
    _instance ??= UserProfileService();
    return _instance!;
  }

  @override
  Stream<RealmResultsChanges<UserProfile>> snapshot() {
    return UserProfileService.instance.realm
        .query<UserProfile>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
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
