import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

class PostFormView extends StatefulWidget {
  const PostFormView({Key? key}) : super(key: key);

  Widget build(context, PostFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PostForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextField(
                label: "Title",
                validator: Validator.required,
                onChanged: (value) {
                  controller.title = value;
                },
              ),
              QMemoField(
                label: "Content",
                validator: Validator.required,
                onChanged: (value) {
                  controller.content = value;
                },
              ),
              QDropdownField(
                label: "Category",
                validator: Validator.required,
                items: const [
                  {
                    "label": "General",
                    "value": "General",
                  },
                  {
                    "label": "Science",
                    "value": "Science",
                  },
                  {
                    "label": "Tech",
                    "value": "Tech",
                  }
                ],
                onChanged: (value, label) {
                  controller.category = value;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 64,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          onPressed: () => controller.doSave(),
          child: const Text("Save"),
        ),
      ),
    );
  }

  @override
  State<PostFormView> createState() => PostFormController();
}
