import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';
import '../controller/favorite_list_controller.dart';

class FavoriteListView extends StatefulWidget {
  const FavoriteListView({Key? key}) : super(key: key);

  Widget build(context, FavoriteListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoriteList"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<FavoriteListView> createState() => FavoriteListController();
}