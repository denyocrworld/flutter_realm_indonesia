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