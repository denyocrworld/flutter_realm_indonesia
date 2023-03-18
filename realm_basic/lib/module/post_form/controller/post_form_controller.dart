import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_basic/core.dart';

class PostFormController extends State<PostFormView> implements MvcController {
  static late PostFormController instance;
  late PostFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      title = widget.item!.title;
      content = widget.item!.content;
      category = widget.item!.category;
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode {
    return widget.item != null;
  }

  String? title;
  String? content;
  String? category;
  doSave() async {
    if (isEditMode) {
      print("update ${widget.item!.id}");

      PostService.instance.update(
        widget.item!,
        title: title,
        content: content,
        category: category,
      );
    } else {
      PostService.instance.add(Post(
        ObjectId(),
        AuthService.currentUser!.id,
        title!,
        content!,
        category!,
        DateTime.now(),
      ));
    }
    Get.back();
  }
}
