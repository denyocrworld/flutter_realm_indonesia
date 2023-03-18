import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';

class AuthService {
  static User? _currentUser;
  static User? get currentUser {
    _currentUser ??= RealmService.app.currentUser;
    return _currentUser;
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      _currentUser = await RealmService.app.logIn(
        Credentials.emailPassword(email, password),
      );

      await RealmService.syncronizeAll();
      await UserProfileService.instance.initUserProfile();

      return true;
    } on Exception catch (err) {
      print("$err");
      return false;
    }
  }

  static Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      EmailPasswordAuthProvider authProvider =
          EmailPasswordAuthProvider(RealmService.app);
      await authProvider.registerUser(email, password);
      return true;
    } on Exception catch (err) {
      print("$err");
      return false;
    }
  }

  static Future logout() async {
    await RealmService.app.removeUser(AuthService._currentUser!);
  }

  static bool get isLoggedIn {
    bool isLoggedIn = RealmService.app.currentUser != null;
    if (isLoggedIn) {
      AuthService._currentUser = RealmService.app.currentUser;
    }
    return isLoggedIn;
  }
}
