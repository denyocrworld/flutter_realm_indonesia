import 'package:flutter/material.dart';
import 'package:realm_basic/state_util.dart';
import '../view/favorite_list_view.dart';

class FavoriteListController extends State<FavoriteListView> implements MvcController {
  static late FavoriteListController instance;
  late FavoriteListView view;

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