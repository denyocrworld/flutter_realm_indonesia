import 'package:realm/realm.dart';
import '../../model/user_profile/user_profile.dart';
import '../auth_service/auth_service.dart';

class RealmBaseService<T extends RealmObject> {
  late Realm realm;

  RealmBaseService() {
    realm = Realm(Configuration.flexibleSync(AuthService.currentUser!, [
      UserProfile.schema,
    ]));
  }

  syncronize() async {
    print("- $syncronize");
    if (realm.subscriptions.isNotEmpty) return;
    String queryAllName = "${this}Subscription";
    print("$queryAllName is created!");
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<T>(), name: queryAllName);
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Stream<RealmResultsChanges<T>> snapshot() {
    return realm.query<T>("TRUEPREDICATE SORT(_id ASC)").changes;
  }

  add(UserProfile item) async {
    realm.write(() {
      realm.add(item);
    });
    print("New user created!");
  }

  Future<void> update(UserProfile item) async {
    realm.write(() {
      item = item;
    });
  }

  delete(UserProfile item) {
    realm.write(() async {
      realm.delete(item);
    });
  }
}
