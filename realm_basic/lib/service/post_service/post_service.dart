import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';

class PostService extends RealmBaseService<Post> {
  static PostService? _instance;
  static PostService get instance {
    _instance ??= PostService();
    return _instance!;
  }

  PostService() {
    realm = Realm(Configuration.flexibleSync(AuthService.currentUser!, [
      Post.schema,
    ]));
  }

  @override
  Stream<RealmResultsChanges<Post>> snapshot() {
    return PostService.instance.realm
        .query<Post>("TRUEPREDICATE SORT(_id ASC)")
        .changes;
  }

  @override
  add(Post item) async {
    realm.write(() {
      realm.add(item);
    });
    print("New user created!");
  }

  @override
  delete(Post item) {
    realm.write(() async {
      realm.delete(item);
    });
  }

  @override
  Future<void> update(
    Post item, {
    String? title,
    String? content,
    String? category,
  }) async {
    realm.write(() {
      item.title = title ?? item.title;
      item.content = content ?? item.content;
      item.category = category ?? item.category;
    });
  }
}
