# realm_basic

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


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