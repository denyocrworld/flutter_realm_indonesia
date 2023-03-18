import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

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
            return ListView.builder(
              itemCount: items.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return Card(
                  child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(
                      item.content,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 60.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(PostFormView(
                                item: item,
                              ));
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 16.0,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          InkWell(
                            onTap: () => controller.doDelete(item),
                            child: const Icon(
                              Icons.delete,
                              size: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<PostListView> createState() => PostListController();
}
