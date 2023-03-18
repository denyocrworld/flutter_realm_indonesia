import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';
import '../controller/post_list_controller.dart';

class PostListView extends StatefulWidget {
  const PostListView({Key? key}) : super(key: key);

  Widget build(context, PostListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PostList"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //
        },
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
  State<PostListView> createState() => PostListController();
}
