import 'package:flutter/material.dart';
import 'package:realm_basic/state_util.dart';
import '../view/post_list_view.dart';

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
}