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
