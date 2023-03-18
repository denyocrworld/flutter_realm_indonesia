import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';
import 'package:realm_basic/service/post_service/post_service.dart';
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
        onPressed: () async {
          Get.to(const PostFormView());
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: PostService.instance.snapshot(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return Container();
            var items = snapshot.data!.results;
            return Text("${items.length}");
          },
        ),
      ),
    );
  }

  @override
  State<PostListView> createState() => PostListController();
}
