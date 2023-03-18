import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "demo@app.com";
  String password = "123456";
  doLogin() async {
    showLoading();
    bool isLoggedIn = await AuthService.login(
      email: email,
      password: password,
    );

    if (!isLoggedIn) {
      hideLoading();
      showInfoDialog("Wrong email or password!");
      return;
    }

    await RealmService.syncronizeAll();

    hideLoading();
    Get.offAll(const MainNavigationView());
  }

  doSignUp() async {
    showLoading();
    try {
      await AuthService.register(
        email: email,
        password: password,
      );
      await AuthService.login(
        email: email,
        password: password,
      );
      await RealmService.syncronizeAll();
      hideLoading();
      Get.offAll(const MainNavigationView());
    } on Exception {
      hideLoading();
      showInfoDialog("Wrong email or password!");
      return;
    }
  }

  bool signUpMode = false;

  updateMode() {
    signUpMode = !signUpMode;
    setState(() {});
  }
}
