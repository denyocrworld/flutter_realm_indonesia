import 'package:realm/realm.dart';

class RealmBaseService<T extends RealmObject> {
  late Realm realm;

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

  RealmResults get({
    String? query,
  }) {
    if (query != null) return realm.query<T>(query);
    return realm.query<T>("TRUEPREDICATE SORT(_id ASC)");
  }

  add(T item) async {
    realm.write(() {
      realm.add(item);
    });
    print("New user created!");
  }

  Future<void> update(T item) async {
    realm.write(() {
      item = item;
    });
  }

  delete(T item) {
    realm.write(() async {
      realm.delete(item);
    });
  }
}
