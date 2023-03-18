# realm_basic

Template project realm.

## Cara Setup Realm
1. Buka file config.dart
2. Ubah appId dan appUrl


## Auth
```
AuthService.login();
AuthService.logout();
```

## Cara membuat model
Contoh:
```
import 'package:realm/realm.dart';

part 'post.g.dart';

@RealmModel()
class _Post {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  @MapTo('user_id')
  late String userId;

  @MapTo('title')
  late String title;

  @MapTo('content')
  late String content;

  @MapTo('category')
  late String category;

  @MapTo('created_at')
  late DateTime createdAt;
}
```

Jalankan perintah ini:
```
flutter pub run realm generate
```

atau
```
realm.bat
```

## Cara membuat Service

Silahkan copas contoh berikut dan sesuaikan!
```

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
```