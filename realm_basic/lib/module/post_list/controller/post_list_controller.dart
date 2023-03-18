import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

class PostListController extends State<PostListView> implements MvcController {
  static late PostListController instance;
  late PostListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doDelete(Post item) async {
    PostService.instance.delete(item);
  }
}
