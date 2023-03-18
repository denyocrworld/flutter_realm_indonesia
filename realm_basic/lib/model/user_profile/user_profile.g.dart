// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserProfile extends _UserProfile
    with RealmEntity, RealmObjectBase, RealmObject {
  UserProfile(
    ObjectId id,
    String userId,
    String name,
    String photo,
    String email,
    String role,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'photo', photo);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'role', role);
  }

  UserProfile._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'user_id') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get photo => RealmObjectBase.get<String>(this, 'photo') as String;
  @override
  set photo(String value) => RealmObjectBase.set(this, 'photo', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get role => RealmObjectBase.get<String>(this, 'role') as String;
  @override
  set role(String value) => RealmObjectBase.set(this, 'role', value);

  @override
  Stream<RealmObjectChanges<UserProfile>> get changes =>
      RealmObjectBase.getChanges<UserProfile>(this);

  @override
  UserProfile freeze() => RealmObjectBase.freezeObject<UserProfile>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserProfile._);
    return const SchemaObject(
        ObjectType.realmObject, UserProfile, 'UserProfile', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('photo', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('role', RealmPropertyType.string),
    ]);
  }
}
