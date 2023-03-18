import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';

class PostFormController extends State<PostFormView> implements MvcController {
  static late PostFormController instance;
  late PostFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? title;
  String? content;
  String? category;
  doSave() {
    PostService.instance.add(Post(
      ObjectId(),
      AuthService.currentUser!.id,
      title!,
      content!,
      category!,
      DateTime.now(),
    ));
    Get.back();
  }
}
